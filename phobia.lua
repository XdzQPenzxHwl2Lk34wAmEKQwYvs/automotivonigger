local panorama_api = panorama.open()

-- #region : Libraries
local pui = require("gamesense/pui")
local csgo_weapons = require("gamesense/csgo_weapons")
local clipboard = require("gamesense/clipboard")
local base64 = require("gamesense/base64")
local vector = require("vector")
local ffi = require("ffi")
local http = require("gamesense/http")
local images = require("gamesense/images")
-- #endregion

local sc = vector(client.screen_size())

local monstry_data = _G.monstry_fetch and _G.monstry_fetch() or {}
-- #region : lua data
local Phobia = {}
do
    Phobia.name = "Phobia"
    Phobia.user = monstry_data.username or panorama_api.MyPersonaAPI.GetName() or "Admin"
    Phobia.steam_name = panorama_api.MyPersonaAPI.GetName()
end

pui.macros.p = "\ade81f7•\r"
pui.macros.accent = "\ade81f7"
-- #endregion

-- #region : Math
math.clamp = function(x, a, b)
    if a > x then
        return a
    elseif b < x then
        return b
    else
        return x
    end
end
math.lerp = function(a, b, w)
    return a + (b - a) * w
end
math.normalize_yaw = function(yaw)
    return (yaw + 180) % -360 + 180
end
math.normalize_pitch = function(pitch)
    return math.clamp(pitch, -89, 89)
end
-- #endregion

-- #region : Events
local events
do
    local event_mt = {
        __call = function(self, fn, bool)
            local action = bool and client.set_event_callback or client.unset_event_callback
            action(self[1], fn)
        end,
        set = function(self, fn)
            client.set_event_callback(self[1], fn)
        end,
        unset = function(self, fn)
            client.unset_event_callback(self[1], fn)
        end,
        fire = function(self, ...)
            client.fire_event(self[1], ...)
        end
    }
    event_mt.__index = event_mt

    events =
        setmetatable(
        {},
        {
            __index = function(self, key)
                self[key] = setmetatable({key}, event_mt)
                return self[key]
            end
        }
    )
end
-- #endregion

-- #region : Color
local color
do
    local RGBtoHEX = function(col, short)
        return string.format(short and "%02X%02X%02X" or "%02X%02X%02X%02X", col.r, col.g, col.b, col.a)
    end

    local HEXtoRGB = function(hex)
        hex = string.gsub(hex, "^#", "")
        return tonumber(string.sub(hex, 1, 2), 16), tonumber(string.sub(hex, 3, 4), 16), tonumber(
            string.sub(hex, 5, 6),
            16
        ), tonumber(string.sub(hex, 7, 8), 16) or 255
    end

    local create

    local mt = {
        __eq = function(a, b)
            return a.r == b.r and a.g == b.g and a.b == b.b and a.a == b.a
        end,
        lerp = function(self, t, w)
            return create(
                self.r + (t.r - self.r) * w,
                self.g + (t.g - self.g) * w,
                self.b + (t.b - self.b) * w,
                self.a + (t.a - self.a) * w
            )
        end,
        to_hex = RGBtoHEX,
        alpha_modulate = function(self, a, r)
            return create(self.r, self.g, self.b, r and a * self.a or a)
        end,
        unpack = function(self)
            return self.r, self.g, self.b, self.a
        end
    }
    mt.__index = mt

    create = ffi.metatype(ffi.typeof("struct { uint8_t r; uint8_t g; uint8_t b; uint8_t a; }"), mt)
    color = function(r, g, b, a)
        local col = {}

        if type(r) == "string" then
            local rh, gh, bh, ah = HEXtoRGB(r)

            col = {
                r = rh,
                g = gh,
                b = bh,
                a = ah
            }
        else
            col = {
                r = r or 255,
                g = b ~= nil and g or r or 255,
                b = b or r or 255,
                a = a or b == nil and g or 255
            }
        end

        return create(col.r, col.g, col.b, col.a)
    end
end
-- #endregion

-- #region : Render
local render
do
    local astack = {}
    local alpha = 1

    render =
        setmetatable(
        {
            push_alpha = function(v)
                local len = #astack
                astack[len + 1] = v
                alpha = alpha * astack[len + 1] * (astack[len] or 1)
                if len > 255 then
                    error "alpha stack exceeded 255 objects, report to developers"
                end
            end,
            pop_alpha = function()
                local len = #astack
                astack[len], len = nil, len - 1
                alpha = len == 0 and 1 or astack[len] * (astack[len - 1] or 1)
            end,
            get_alpha = function()
                return alpha
            end,
            gradient = function(position, size, c1, c2, dir)
                local x, y = position.x, position.y
                local w, h = size.x, size.y
                renderer.gradient(
                    x,
                    y,
                    w,
                    h,
                    c1.r,
                    c1.g,
                    c1.b,
                    c1.a * alpha,
                    c2.r,
                    c2.g,
                    c2.b,
                    c2.a * alpha,
                    dir or false
                )
            end,
            line = function(xa, ya, xb, yb, c)
                renderer.line(xa, ya, xb, yb, c.r, c.g, c.b, c.a * alpha)
            end,
            rectangle = function(x, y, w, h, c, n)
                n = n or 0
                local r, g, b, a = c.r, c.g, c.b, c.a * alpha

                if n == 0 then
                    renderer.rectangle(x, y, w, h, r, g, b, a)
                else
                    renderer.circle(x + n, y + n, r, g, b, a, n, 180, 0.25)
                    renderer.rectangle(x + n, y, w - n - n, n, r, g, b, a)
                    renderer.circle(x + w - n, y + n, r, g, b, a, n, 90, 0.25)
                    renderer.rectangle(x, y + n, w, h - n - n, r, g, b, a)
                    renderer.circle(x + n, y + h - n, r, g, b, a, n, 270, 0.25)
                    renderer.rectangle(x + n, y + h - n, w - n - n, n, r, g, b, a)
                    renderer.circle(x + w - n, y + h - n, r, g, b, a, n, 0, 0.25)
                end
            end,
            rect_outline = function(x, y, w, h, c, n, t)
                n, t = n or 0, t or 1
                local r, g, b, a = c.r, c.g, c.b, c.a * alpha

                if n == 0 then
                    renderer.rectangle(x, y, w - t, t, r, g, b, a)
                    renderer.rectangle(x, y + t, t, h - t, r, g, b, a)
                    renderer.rectangle(x + w - t, y, t, h - t, r, g, b, a)
                    renderer.rectangle(x + t, y + h - t, w - t, t, r, g, b, a)
                else
                    renderer.circle_outline(x + n, y + n, r, g, b, a, n, 180, 0.25, t)
                    renderer.rectangle(x + n, y, w - n - n, t, r, g, b, a)
                    renderer.circle_outline(x + w - n, y + n, r, g, b, a, n, 270, 0.25, t)
                    renderer.rectangle(x, y + n, t, h - n - n, r, g, b, a)
                    renderer.circle_outline(x + n, y + h - n, r, g, b, a, n, 90, 0.25, t)
                    renderer.rectangle(x + n, y + h - t, w - n - n, t, r, g, b, a)
                    renderer.circle_outline(x + w - n, y + h - n, r, g, b, a, n, 0, 0.25, t)
                    renderer.rectangle(x + w - t, y + n, t, h - n - n, r, g, b, a)
                end
            end,
            triangle = function(x1, y1, x2, y2, x3, y3, c)
                renderer.triangle(x1, y1, x2, y2, x3, y3, c.r, c.g, c.b, c.a * alpha)
            end,
            circle = function(x, y, c, radius, start, percentage)
                renderer.circle(x, y, c.r, c.g, c.b, c.a * alpha, radius, start or 0, percentage or 1)
            end,
            circle_outline = function(x, y, c, radius, start, percentage, thickness)
                renderer.circle(x, y, c.r, c.g, c.b, c.a * alpha, radius, start or 0, percentage or 1, thickness)
            end,
            shadow = function(x, y, width, height, radius, glow_size, r, g, b, a)
                for i = glow_size, 1, -1 do
                    local alpha = a * (i / glow_size) * 0.6
                    if alpha <= 0 then
                        goto continue
                    end
                    render.rectangle(x - i, y - i, width + i * 2, height + i * 2, color(r, g, b, alpha), .25)
                end

                render.rectangle(x, y, width, height, color(r, g, b, a), .25)
                ::continue::
            end,
            load_rgba = function(c, w, h)
                return renderer.load_rgba(c, w, h)
            end,
            load_jpg = function(c, w, h)
                return renderer.load_jpg(c, w, h)
            end,
            load_png = function(c, w, h)
                return renderer.load_png(c, w, h)
            end,
            load_svg = function(c, w, h)
                return renderer.load_svg(c, w, h)
            end,
            texture = function(id, x, y, w, h, c, mode)
                if not id then
                    return
                end
                renderer.texture(id, x, y, w, h, c.r, c.g, c.b, c.a * alpha, mode or "f")
            end,
            colored_text = function(text, clr)
                clr.a = clr.a * alpha

                local hexed = clr:to_hex()
                local default = color(200, clr.a):to_hex()

                text = ("\a%s%s"):format(default, text)

                local tmp = ("\a%s%%1\a%s"):format(hexed, default)
                local result = text:gsub("%${(.-)}", tmp)

                return result
            end,
            text = function(x, y, c, flags, width, ...)
                renderer.text(x, y, c.r, c.g, c.b, c.a * alpha, (flags or ""), width or 0, ...)
            end,
            measure_text = function(flags, text)
                if not text or text == "" then
                    return vector(0, 0)
                end

                flags = (flags or "")

                return vector(renderer.measure_text(flags, text))
            end,
            to_hex = function(r, g, b, a)
                return string.format("%02x%02x%02x%02x", r, g, b, a)
            end,
            breath = function(x)
                x = x % 2.0

                if x > 1.0 then
                    x = 2.0 - x
                end

                return x
            end,
            u8 = function(s)
                return string.gsub(s, "[\128-\191]", "")
            end,
            gradient_text = function(s, clock, r1, g1, b1, a1, r2, g2, b2, a2)
                local buffer = {}

                local len = #render.u8(s)
                local div = 1 / (len - 1)

                local add_r = r2 - r1
                local add_g = g2 - g1
                local add_b = b2 - b1
                local add_a = a2 - a1

                for char in string.gmatch(s, ".[\128-\191]*") do
                    local t = render.breath(clock)

                    local r = r1 + add_r * t
                    local g = g1 + add_g * t
                    local b = b1 + add_b * t
                    local a = a1 + add_a * t

                    buffer[#buffer + 1] = "\a"
                    buffer[#buffer + 1] = render.to_hex(r, g, b, a)
                    buffer[#buffer + 1] = char

                    clock = clock - div
                end

                return table.concat(buffer)
            end
        },
        {__index = renderer}
    )
end
-- #endregion

-- #region : Anim
local anim = {}
do
    anim._list = {}

    anim.lerp = function(start, end_pos, time)
        time = time or 0.095

        if math.abs(start - end_pos) < 1 then
            return end_pos
        end

        time = math.clamp(globals.frametime() * time * 170, 0.01, 1)

        return start + (end_pos - start) * time
    end

    anim.new = function(name, new_value, speed)
        speed = speed or 0.095

        if anim._list[name] == nil then
            anim._list[name] = new_value
        end

        anim._list[name] = anim.lerp(anim._list[name], new_value, speed)

        return anim._list[name]
    end
end
-- #endregion

-- #region : print_raw
local print_raw
do
    local native_print =
        vtable_bind("vstdlib.dll", "VEngineCvar007", 25, "void(__cdecl*)(void*, const void*, const char*, ...)")

    print_raw = function(...)
        native_print(pui.macros.accent, ("  %s "):format(Phobia.name))
        native_print(color(200), "· ")

        local tmp = "\a(%x%x%x%x%x%x%x%x)([^\a]*)"
        for k, v in pairs({...}) do
            local msg = tostring(v)

            if msg:find(tmp) then
                for clr, text in msg:gmatch(tmp) do
                    native_print(color(clr:sub(1, 6)), text)
                end
            else
                native_print(color(200), msg)
            end
        end

        native_print(color(255), "\n")
    end
end
-- #endregion

-- #region : Entity Helpers
do
    local native_GetClientEntity =
        vtable_bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
    local native_GetHighestEntityIndex = vtable_bind("client.dll", "VClientEntityList003", 6, "int(__thiscall*)(void*)")
    local native_GetClientNetworkable =
        vtable_bind("client.dll", "VClientEntityList003", 0, "void*(__thiscall*)(void*, int)")
    local native_GetClientClass = vtable_thunk(2, "void*(__thiscall*)(void*)")

    entity.get_all = function(optional_classname)
        local entities = {}

        for i = 0, native_GetHighestEntityIndex() do
            local ent = native_GetClientEntity(i)
            if ent == nil then
                goto continue
            end

            local net = native_GetClientNetworkable(i)
            if net == nil then
                goto continue
            end

            local class = native_GetClientClass(net)
            if class == nil then
                goto continue
            end

            local classname = ffi.string(ffi.cast("const char**", ffi.cast("char*", class) + 8)[0])
            if optional_classname == nil or classname == optional_classname then
                table.insert(entities, i)
            end

            ::continue::
        end

        return entities
    end

    entity.get_players = function(enemies_only, include_dormant, fn)
        local results = {}
        local players = entity.get_all("CCSPlayer")

        for _, player in pairs(players) do
            if (not enemies_only or entity.is_enemy(player)) and (include_dormant or not entity.is_dormant(player)) then
                if fn ~= nil then
                    fn(player)
                end

                table.insert(results, player)
            end
        end

        return results
    end

    ffi.cdef [[
        typedef struct {
            char pad0[0x18];
            float anim_update_timer;
            char pad1[0xC];
            float started_moving_time;
            float last_move_time;
            char pad2[0x10];
            float last_lby_time;
            char pad3[0x8];
            float run_amount;
            char pad4[0x10];
            void* entity;
            void* active_weapon;
            void* last_active_weapon;
            float last_client_side_animation_update_time;
            int	 last_client_side_animation_update_framecount;
            float eye_timer;
            float eye_angles_y;
            float eye_angles_x;
            float goal_feet_yaw;
            float current_feet_yaw;
            float torso_yaw;
            float last_move_yaw;
            float lean_amount;
            char pad5[0x4];
            float feet_cycle;
            float feet_yaw_rate;
            char pad6[0x4];
            float duck_amount;
            float landing_duck_amount;
            char pad7[0x4];
            float current_origin[3];
            float last_origin[3];
            float velocity_x;
            float velocity_y;
            char pad8[0x4];
            float unknown_float1;
            char pad9[0x8];
            float unknown_float2;
            float unknown_float3;
            float unknown;
            float m_velocity;
            float jump_fall_velocity;
            float clamped_velocity;
            float feet_speed_forwards_or_sideways;
            float feet_speed_unknown_forwards_or_sideways;
            float last_time_started_moving;
            float last_time_stopped_moving;
            bool on_ground;
            bool hit_in_ground_animation;
            char pad10[0x4];
            float time_since_in_air;
            float last_origin_z;
            float head_from_ground_distance_standing;
            float stop_to_full_running_fraction;
            char pad11[0x4];
            float magic_fraction;
            char pad12[0x3C];
            float world_force;
            char pad13[0x1CA];
            float min_yaw;
            float max_yaw;
        } CAnimationState;

        typedef struct {
            char  pad_0000[20];
            int m_nOrder;
            int m_nSequence;
            float m_flPrevCycle;
            float m_flWeight;
            float m_flWeightDeltaRate;
            float m_flPlaybackRate;
            float m_flCycle;
            void *m_pOwner;
            char  pad_0038[4];
        } CAnimationLayer;
    ]]

    entity.get_animstate = function(ent)
        local pointer = native_GetClientEntity(ent)
        if pointer then
            return ffi.cast("CAnimationState**", ffi.cast("char*", ffi.cast("void***", pointer)) + 0x9960)[0]
        end
        return
    end

    entity.get_animlayer = function(ent, layer)
        local pointer = native_GetClientEntity(ent)
        if pointer then
            return ffi.cast("CAnimationLayer**", ffi.cast("char*", ffi.cast(ffi.typeof("void***"), pointer)) + 0x2990)[0][
                layer
            ]
        end
        return
    end

    entity.get_simtime = function(ent)
        local pointer = native_GetClientEntity(ent)
        if pointer then
            return entity.get_prop(ent, "m_flSimulationTime"), ffi.cast(
                "float*",
                ffi.cast("uintptr_t", pointer) + 0x26C
            )[0]
        else
            return 0
        end
    end

    entity.get_max_desync = function(animstate)
        local speedfactor = math.clamp(animstate.feet_speed_forwards_or_sideways, 0, 1)
        local avg_speedfactor = (animstate.stop_to_full_running_fraction * -0.3 - 0.2) * speedfactor + 1

        local duck_amount = animstate.duck_amount
        if duck_amount > 0 then
            local duck_speed = duck_amount * speedfactor

            avg_speedfactor = avg_speedfactor + (duck_speed * (0.5 - avg_speedfactor))
        end

        return math.clamp(avg_speedfactor, .5, 1)
    end
end
-- #endregion

-- #region : Database
local db = {
    name = ("%s::data"):format(Phobia.name:lower())
}
do
    db.data = database.read(db.name)

    if not db.data then
        db.data = {}
    end

    db.read = function(key)
        return db.data[key]
    end

    db.write = function(key, value)
        db.data[key] = value
    end
end
-- #endregion

-- #region : Refs
local refs = {
    antiaim = {
        antiaim_enabled = pui.reference("AA", "Anti-Aimbot angles", "Enabled"),
        pitch = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Pitch")}
            return ref[1]
        end)(),
        pitch_offset = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Pitch")}
            return ref[2]
        end)(),
        yaw_base = pui.reference("AA", "Anti-Aimbot angles", "Yaw base"),
        yaw = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Yaw")}
            return ref[1]
        end)(),
        yaw_offset = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Yaw")}
            return ref[2]
        end)(),
        yaw_jitter = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Yaw jitter")}
            return ref[1]
        end)(),
        yaw_jitter_offset = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Yaw jitter")}
            return ref[2]
        end)(),
        body_yaw = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Body yaw")}
            return ref[1]
        end)(),
        body_yaw_offset = (function()
            local ref = {pui.reference("AA", "Anti-Aimbot angles", "Body yaw")}
            return ref[2]
        end)(),
        freestanding_body_yaw = pui.reference("AA", "Anti-Aimbot angles", "Freestanding body yaw"),
        edge_yaw = pui.reference("AA", "Anti-Aimbot angles", "Edge yaw"),
        freestanding = pui.reference("AA", "Anti-Aimbot angles", "Freestanding"),
        roll = pui.reference("AA", "Anti-Aimbot angles", "Roll"),
        fakelag = pui.reference("AA", "Fake lag", "Enabled"),
        fakelag_amount = pui.reference("AA", "Fake lag", "Amount"),
        fakelag_variance = pui.reference("AA", "Fake lag", "Variance"),
        fakelag_limit = pui.reference("AA", "Fake lag", "Limit"),
        limit = pui.reference("AA", "Fake lag", "Limit"),
        leg_movement = pui.reference("AA", "Other", "Leg movement"),
        fake_peek = pui.reference("AA", "Other", "Fake peek"),
        slow_motion = pui.reference("AA", "Other", "Slow motion"),
        onshot = pui.reference("AA", "Other", "On shot anti-aim")
    },
    other = {
        aimbot = {pui.reference("RAGE", "Aimbot", "Enabled")},
        doubletap = pui.reference("RAGE", "Aimbot", "Double tap"),
        doubletap_fakelag = pui.reference("RAGE", "Aimbot", "Double tap fake lag limit"),
        fake_duck = pui.reference("RAGE", "Other", "Duck peek assist"),
        min_damage = pui.reference("RAGE", "Aimbot", "Minimum damage"),
        hit_chance = pui.reference("RAGE", "Aimbot", "Minimum hit chance"),
        force_baim = pui.reference("RAGE", "Aimbot", "Force body aim"),
        force_sp = pui.reference("RAGE", "Aimbot", "Force safe point"),
        min_damage_override = {pui.reference("RAGE", "Aimbot", "Minimum damage override")},
        remove_scope = pui.reference("VISUALS", "Effects", "Remove scope overlay"),
        lp_chams = {pui.reference("VISUALS", "Colored models", "Local player")},
        thirdperson = {pui.reference("VISUALS", "Effects", "Force third person (alive)")}
    }
}
-- #endregion

-- #region : My
local my = {
    entity = entity.get_local_player(),
    valid = false,
    threat = client.current_threat(),
    scoped = false,
    weapon = nil,
    side = 0,
    origin = vector(),
    velocity = -1,
    movetype = -1,
    jumping = false,
    in_score = false,
    command_number = 0,
    state = -1,
    states = {
        unknown = -1,
        standing = 2,
        running = 3,
        walking = 4,
        crouching = 5,
        sneaking = 6,
        air = 7,
        air_crouch = 8,
        freestanding = 9,
        manual_yaw = 10,
        planting = 11
    }
}
do
    events.paint_ui:set(
        function()
            my.entity = entity.get_local_player()
            my.valid = my.entity and entity.is_alive(my.entity)
        end
    )

    my.update_netvars = function(cmd)
        my.entity = entity.get_local_player()
        my.valid = my.entity and entity.is_alive(my.entity)
        my.command_number = cmd.command_number

        if my.valid then
            local velocity = vector(entity.get_prop(my.entity, "m_vecVelocity"))
            my.velocity = velocity:length2d()
            my.origin = vector(entity.get_prop(my.entity, "m_vecOrigin"))
            my.scoped = entity.get_prop(my.entity, "m_bIsScoped") == 1
            my.weapon = entity.get_player_weapon(my.entity)
            my.movetype = entity.get_prop(my.entity, "m_MoveType")
            my.threat = client.current_threat()
            my.jumping = cmd.in_jump == 1
            my.in_score = cmd.in_score == 1

            if my.side == 0 then
                my.side = (cmd.sidemove > 0) and 1 or (cmd.sidemove < 0) and -1 or 0
            end

            if not my.scoped then
                my.side = 0
            end
        end
    end

    my.update_state = function(cmd)
        if not my.valid then
            return
        end

        local flags = entity.get_prop(my.entity, "m_fFlags")

        local on_ground = bit.band(flags, bit.lshift(1, 0)) == 1
        local is_not_moving = my.velocity < 5
        local is_walking = cmd.in_speed == 1
        local is_crouching = cmd.in_duck == 1 or refs.other.fake_duck:get()
        local in_air = not on_ground or cmd.in_jump == 1

        if is_crouching and in_air then
            my.state = my.states.air_crouch
            return
        end

        if in_air then
            my.state = my.states.air
            return
        end

        if not is_crouching and is_not_moving then
            my.state = my.states.standing
            return
        end

        if is_walking then
            my.state = my.states.walking
            return
        end

        if is_crouching and not is_not_moving then
            my.state = my.states.sneaking
            return
        end

        if is_crouching and is_not_moving then
            my.state = my.states.crouching
            return
        end

        if not is_crouching and not is_not_moving and not is_walking then
            my.state = my.states.running
            return
        end

        my.state = my.states.unknown
    end

    events.setup_command:set(
        function(cmd)
            my.update_netvars(cmd)
            my.update_state(cmd)
        end
    )
end
-- #endregion

-- #region : Exploit
local exploit = {
    diff = 0,
    defensive = false,
    shift = false,
    active = false
}
do
    local last_commandnumber = 0
    local tickbase_max = 0

    events.run_command:set(
        function(cmd)
            if not my.valid then
                return
            end

            local tickbase = entity.get_prop(my.entity, "m_nTickBase") or 0
            local client_latency = client.latency()

            local shift =
                math.floor(
                tickbase - globals.tickcount() - 3 - toticks(client_latency) * 0.5 + 0.5 * (client_latency * 10)
            )
            local wanted = -14 + (refs.other.doubletap_fakelag:get() - 1) + 3

            exploit.shift = shift <= wanted

            last_commandnumber = cmd.command_number
        end
    )

    events.predict_command:set(
        function(cmd)
            if not my.valid then
                return
            end

            if last_commandnumber ~= cmd.command_number then
                return
            end

            exploit.active =
                refs.other.doubletap:get() and refs.other.doubletap.hotkey:get() or
                refs.antiaim.onshot:get() and refs.antiaim.onshot.hotkey:get()

            local tickbase = entity.get_prop(my.entity, "m_nTickBase") or 0

            if tickbase_max ~= nil then
                exploit.diff = tickbase - tickbase_max
                exploit.defensive = exploit.diff < -3
            end

            tickbase_max = math.max(tickbase, tickbase_max or 0)

            last_commandnumber = nil
        end
    )

    events.level_init:set(
        function(cmd)
            exploit.diff = 0
            exploit.defensive = false
            exploit.shift = false
            exploit.active = false
        end
    )
end
-- #endregion

-- #region : Menu
local menu = {
    refs = {},
    depends = {},
    elements = {}
}
do
    menu.global_update_callback = function()
        for k, v in pairs(menu.refs) do
            for name, ref in pairs(v) do
                if menu.depends[k] then
                    if menu.depends[k][name] then
                        ref:set_visible(menu.depends[k][name]())
                    end
                end
            end
        end
    end

    menu.new = function(tab, name, cheat_var, depends)
        if menu.refs[tab] == nil then
            menu.refs[tab] = {}
            menu.elements[tab] = {}
        end

        if menu.elements[tab][name] ~= nil then
            error(("Element already exists: [%s][%s]"):format(tab, name))
        end

        menu.refs[tab][name] = cheat_var

        local update = function()
            if cheat_var.type == "color_picker" then
                menu.elements[tab][name] = color(cheat_var:get())
            elseif cheat_var.type == "multiselect" then
                local value_list = cheat_var.value

                local tmp = {}
                for k, v in pairs(value_list) do
                    tmp[v] = true
                end

                menu.elements[tab][name] = tmp
            else
                menu.elements[tab][name] = cheat_var.value
            end
        end

        if depends ~= nil then
            if type(depends) == "function" then
                if menu.depends[tab] == nil then
                    menu.depends[tab] = {}
                end

                menu.depends[tab][name] = depends
            end
        end

        cheat_var:set_callback(update, true)
        cheat_var:set_callback(menu.global_update_callback, true)

        return cheat_var
    end

    local menu_mt = {
        __index = function(self, index, args)
            return (function(...)
                local group = ...

                return (function(...)
                    local item = group[index](group, ...)

                    return (function(tab, name, ...)
                        menu.new(tab, name, item, ...)

                        return item
                    end)
                end)
            end)
        end
    }

    menu = setmetatable(menu, menu_mt)
end
-- #endregion

-- #region : groups
local groups = {
    antiaim = pui.group("AA", "Anti-aimbot angles"),
    fakelag = pui.group("AA", "Fake lag"),
    other = pui.group("AA", "Other")
}
-- #endregion

--\a373737FF‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

-- #region : Tab Selector
local ts = {}
do
    menu.label(groups.other)(("\v%s Umbrella"):format(Phobia.name))("main", "info_header")
    menu.label(groups.other)(("User: \v%s\r"):format(Phobia.user))("main", "user")

    menu.combobox(groups.other)("\ntab_selector", {"Home", "Anti-Aim", "Other"}, nil, false)("main", "tab_selector")

    menu.button(groups.other)(
        "Discord",
        function()
            panorama.open().SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/sWNnAtTFyT")
        end
    )(
        "main",
        "discord",
        function()
            return menu.elements["main"]["tab_selector"] == "Home"
        end
    )
    menu.combobox(groups.antiaim)("Anti-Aim", {"Settings", "Builder"}, nil, false)(
        "main",
        "tab_selector_aa",
        function()
            return menu.elements["main"]["tab_selector"] == "Anti-Aim"
        end
    )

    menu.combobox(groups.antiaim)("Other", {"Indicators", "Miscellaneous", "Visuals"}, nil, false)(
        "main",
        "tab_selector_other",
        function()
            return menu.elements["main"]["tab_selector"] == "Other"
        end
    )

    menu.label(groups.antiaim)("Accent Color")(
        "visuals",
        "accent_color_label",
        function()
            return menu.elements["main"]["tab_selector"] == "Other" and
                menu.elements["main"]["tab_selector_other"] == "Indicators"
        end
    )
    menu.color_picker(groups.antiaim)("\naccent_color", color("de81f7"))(
        "visuals",
        "accent_color",
        function()
            return menu.elements["main"]["tab_selector"] == "Other" and
                menu.elements["main"]["tab_selector_other"] == "Indicators"
        end
    )

    menu.refs["visuals"]["accent_color"]:set_callback(
        function(self)
            pui.macros.accent = color(self:get())
        end,
        true
    )

    menu.label(groups.antiaim)("\ntab_selector_other_space")(
        "main",
        "tab_selector_other_space",
        function()
            return menu.elements["main"]["tab_selector"] == "Other"
        end
    )

    ts.is_home = function()
        return menu.elements["main"]["tab_selector"] == "Home"
    end

    ts.is_antiaim = function()
        return menu.elements["main"]["tab_selector"] == "Anti-Aim" and
            menu.elements["main"]["tab_selector_aa"] == "Settings"
    end

    ts.is_antiaim2 = function()
        return menu.elements["main"]["tab_selector"] == "Anti-Aim" and
            menu.elements["main"]["tab_selector_aa"] == "Builder"
    end

    ts.is_indicators = function()
        return menu.elements["main"]["tab_selector"] == "Other" and
            menu.elements["main"]["tab_selector_other"] == "Indicators"
    end

    ts.is_misc = function()
        return menu.elements["main"]["tab_selector"] == "Other" and
            menu.elements["main"]["tab_selector_other"] == "Miscellaneous"
    end

    ts.is_other = function()
        return menu.elements["main"]["tab_selector"] == "Other" and
            menu.elements["main"]["tab_selector_other"] == "Visuals"
    end

    menu.combobox(groups.antiaim)("\nstate_type", {"Default", "Defensive"}, nil, false)(
        "antiaim",
        "state_type",
        ts.is_antiaim2
    )
    menu.label(groups.antiaim)("\n")(
        "main",
        "tab_selector_aa_space",
        function()
            return menu.elements["main"]["tab_selector"] == "Anti-Aim"
        end
    )
end
-- #endregion

-- #region : Configs
events.paint_ui:set(
    function()
        pui.traverse(
            refs.antiaim,
            function(ref)
                ref:set_visible(false)
                refs.antiaim.onshot:set_visible(ts.is_antiaim2())
            end
        )
    end
)
-- #endregion

-- #hide onshots
events.paint_ui:set(
    function()
        pui.traverse(
            refs.antiaim.onshot,
            function(ref)
                ref:set_visible(false)
                onshotaa = ref == 0 and menu.refs["antiaim"]["onshotaa"]:get()
            end
        )
    end
)
-- end
refs.antiaim.freestanding.hotkey:override("Always on")
-- freestand
events.paint_ui:set(
    function()
        pui.traverse(
            refs.antiaim.freestanding,
            function(ref)
                ref:set_visible(false)
                local fs = menu.refs["antiaim"]["freestanding_hotkey"]:get()

                if fs == true then
                    ref:set_hotkey("Always On")
                    ref:override(true)
                else
                    ref:override(false)
                end
            end
        )
    end
)
--

-- #region : Configs
local configs = {
    db = db.read("configs") or {},
    data = {},
    maximum_count = 10
}
do
    configs.compile = function(data)
        if data == nil then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        success, data =
            pcall(
            function()
                return base64.encode(json.stringify(data))
            end
        )

        if not success then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        return ("%s::gs::%s"):format(Phobia.name:lower(), data:gsub("=", "_"):gsub("+", "Z1337Z"))
    end

    configs.decompile = function(data)
        if data == nil then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        if not data:find(("%s::gs::"):format(Phobia.name:lower())) then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        data = data:gsub(("%s::gs::"):format(Phobia.name:lower()), ""):gsub("_", "="):gsub("Z1337Z", "+")

        success, data =
            pcall(
            function()
                return json.parse(base64.decode(data))
            end
        )

        if not success then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        return data
    end

    configs.load = function(id, tab)
        local db_data = configs.db[id]

        if db_data == nil then
            print_raw(("Config not selected or something went wrong with database!"):format(name))
            client.exec("play resource\\warning.wav")
            return
        end

        if db_data.data == nil or db_data.data == "" then
            print_raw("An error occured with database!")
            client.exec("play resource\\warning.wav")
            return
        end

        if id > #configs.db then
            print_raw("An error occured with database!")
            client.exec("play resource\\warning.wav")
            return
        end

        local name = db_data.name
        local data = db_data.data

        configs.data:load(data, tab)

        print_raw(("%s successfully loaded!"):format(name))
        client.exec("play ui\\beepclear")
    end

    configs.save = function(id)
        local db_data = configs.db[id]

        if db_data == nil then
            print_raw(("Config not selected or something went wrong with database!"):format(name))
            client.exec("play resource\\warning.wav")
            return
        end

        local name = db_data.name

        configs.db[id].data = configs.data:save()
        db.write("configs", configs.db)

        print_raw(("%s successfully saved!"):format(name))
        client.exec("play ui\\beepclear")
    end

    configs.export = function(id)
        local db_data = configs.db[id]

        if db_data == nil then
            print_raw(("Config not selected or something went wrong with database!"):format(name))
            client.exec("play resource\\warning.wav")
            return
        end

        local name = db_data.name
        local data = configs.compile(db_data)

        clipboard.set(data)

        print_raw(("%s successfully exported!"):format(name))
        client.exec("play ui\\beepclear")
    end

    configs.remove = function(id)
        local db_data = configs.db[id]

        if db_data == nil then
            print_raw(("Config not selected or something went wrong with database!"):format(name))
            client.exec("play resource\\warning.wav")
            return
        end

        local name = db_data.name

        table.remove(configs.db, id)
        db.write("configs", configs.db)

        print_raw(("%s successfully removed!"):format(name))
        client.exec("play ui\\beepclear")
    end

    configs.create = function(name, author, data)
        if type(name) ~= "string" then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        if name == nil then
            print_raw("Name of config is invalid!")
            client.exec("play resource\\warning.wav")
            return
        end

        if #name == 0 or string.match(name, "%s%s") then
            print_raw("Name of config is empty!")
            client.exec("play resource\\warning.wav")
            return
        end

        if #name > 24 then
            print_raw("Name of config is too long!")
            client.exec("play resource\\warning.wav")
            return
        end

        local already_created = function()
            local val = true

            for i = 1, #configs.db do
                val = val and name ~= configs.db[i].name
            end

            return val
        end

        if not already_created() then
            print_raw(("%s is already created!"):format(name))
            client.exec("play resource\\warning.wav")
            return
        end

        if #configs.db > configs.maximum_count then
            print_raw("Too much configs!")
            client.exec("play resource\\warning.wav")
            return
        end

        table.insert(
            configs.db,
            {
                name = name,
                author = author,
                data = data
            }
        )

        db.write("configs", configs.db)

        print_raw(("%s successfully created!"):format(name))
        client.exec("play ui\\beepclear")
    end

    configs.update_list = function()
        local ref = menu.refs["configs"]["configs_list"]

        local tmp = {}

        for _, configuration in pairs(configs.db) do
            table.insert(tmp, ("%s • %s"):format(configuration.name, configuration.author))
        end

        ui.update(ref.ref, #tmp ~= 0 and tmp ~= nil and tmp or {"Empty configs list"}) --бля ебанный енк
    end

    menu.listbox(groups.antiaim)("\n", {"Empty configs list"})("configs", "configs_list", ts.is_home)

    menu.textbox(groups.antiaim)("Config Name")("configs", "config_name", ts.is_home)

    menu.button(groups.antiaim)(
        "Create New",
        function()
            configs.create(menu.refs["configs"]["config_name"]:get(), Phobia.user, configs.data:save())
            configs.update_list()
        end
    )("configs", "config_create", ts.is_home)

    menu.button(groups.antiaim)(
        "Import",
        function()
            configs.import()
            configs.update_list()
        end
    )("configs", "config_import", ts.is_home)

    menu.button(groups.antiaim)(
        "Load",
        function()
            local key = menu.elements["configs"]["configs_list"] + 1

            configs.load(key)
            configs.update_list()
        end
    )("configs", "config_load", ts.is_home)

    menu.button(groups.antiaim)(
        "Save",
        function()
            local key = menu.elements["configs"]["configs_list"] + 1

            configs.save(key)
            configs.update_list()
        end
    )("configs", "config_save", ts.is_home)

    menu.button(groups.antiaim)(
        "Delete",
        function()
            local key = menu.elements["configs"]["configs_list"] + 1

            configs.remove(key)
            configs.update_list()
        end
    )("configs", "config_delete", ts.is_home)

    configs.import = function()
        local clipboard_data = clipboard.get()

        if clipboard_data == nil then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        local decompiled = configs.decompile(clipboard_data)

        if decompiled == nil then
            print_raw("An error occured with config!")
            client.exec("play resource\\warning.wav")
            return
        end

        local name = decompiled.name
        local author = decompiled.author
        local data = decompiled.data

        if #configs.db > configs.maximum_count then
            print_raw("Too much configs!")
            client.exec("play resource\\warning.wav")
            return
        end

        table.insert(
            configs.db,
            {
                name = name,
                author = author,
                data = data
            }
        )

        db.write("configs", configs.db)

        print_raw(("%s successfully imported!"):format(name))
        client.exec("play ui\\beepclear")
    end
    menu.button(groups.antiaim)(
        "Export",
        function()
            local key = menu.elements["configs"]["configs_list"] + 1

            configs.export(key)
            configs.update_list()
        end
    )("configs", "config_export", ts.is_home)

    configs.update_list()
end
-- #endregion

-- #region : antiaim
local antiaim = {
    data = {
        inverter = false,
        ticks = 0,
        way = 0
    },
    defensive = {
        ticks = 0,
        switch = 0
    },
    elements = {},
    state = -1,
    states_names = {
        "Shared",
        "Standing",
        "Running",
        "Walking",
        "Crouching",
        "Sneaking",
        "Air",
        "Air & Crouch",
        "Freestanding",
        "Manual Yaw"
    }
}
do
    antiaim.manuals = {}
    do
        local manuals = antiaim.manuals

        manuals.yaw_offset = 0
        manuals.last_tick = 0
        manuals.yaw_list = {
            ["left"] = -90,
            ["right"] = 90
        }

        manuals.handle = function(new_config)
            for dir, yaw in pairs(manuals.yaw_list) do
                if menu.refs["antiaim"][dir]:get() and manuals.last_tick + 0.2 < globals.realtime() then
                    manuals.yaw_offset = manuals.yaw_offset == yaw and 0 or yaw
                    manuals.last_tick = globals.realtime()
                elseif manuals.last_tick > globals.realtime() then
                    manuals.last_tick = globals.realtime()
                end
            end

            new_config.yaw_base = menu.elements["antiaim"]["yaw_base"]
            new_config.yaw_offset = math.normalize_yaw(new_config.yaw_offset + manuals.yaw_offset)
            new_config.edge_yaw = manuals.yaw_offset == 0 and menu.refs["antiaim"]["edge_yaw"]:get()
        end

        --menu.checkbox(groups.antiaim)("Freestand Enable")("antiaim", "freestanding", ts.is_antiaim)
        menu.hotkey(groups.fakelag)("Freestand")("antiaim", "freestanding_hotkey", ts.is_antiaim)
        menu.hotkey(groups.fakelag)("Left")("antiaim", "left", ts.is_antiaim)
        menu.hotkey(groups.fakelag)("Right")("antiaim", "right", ts.is_antiaim)
        menu.hotkey(groups.fakelag)("Edge yaw")("antiaim", "edge_yaw", ts.is_antiaim)
        menu.hotkey(groups.fakelag)("On Shot Anti-Aims")("antiaim", "onshotaa", ts.is_antiaim)
        menu.combobox(groups.fakelag)("Yaw Base", {"Local View", "At Targets"})("antiaim", "yaw_base", ts.is_antiaim)
        menu.label(groups.fakelag)("\n")("antiaim", "manuals_space", ts.is_antiaim)
    end

    antiaim.on_use = {}
    do
        local on_use = antiaim.on_use

        on_use.start_time = globals.realtime()

        on_use.handle = function(cmd, new_config)
            if not menu.elements["antiaim"]["on_use"] then
                return
            end

            if cmd.in_use == 0 then
                on_use.start_time = globals.realtime()
                return
            end

            local is_ct = entity.get_prop(my.entity, "m_iTeamNum") == 3

            local CPlantedC4 = entity.get_all("CPlantedC4")
            local m_bIsGrabbingHostage = entity.get_prop(my.entity, "m_bIsGrabbingHostage")

            if is_ct then
                if #CPlantedC4 > 0 then
                    local bomb = CPlantedC4[#CPlantedC4]
                    local bomb_origin = vector(entity.get_prop(bomb, "m_vecOrigin"))

                    local dist = my.origin:dist(bomb_origin)

                    if dist < 65 then
                        return
                    end
                end
            end

            if m_bIsGrabbingHostage == 1 then
                return
            end

            if cmd.in_use == 1 then
                if globals.realtime() - on_use.start_time < 0.02 then
                    return
                end
            end

            cmd.in_use = 0

            new_config.pitch = "Off"
            new_config.yaw_base = "Local view"
            new_config.yaw_offset = 180

            new_config.edge_yaw = false

            cmd.force_defensive = false
        end

        menu.checkbox(groups.antiaim)("Allow On Use")("antiaim", "on_use", ts.is_antiaim)
    end

    antiaim.avoid_backstab = {}
    do
        local avoid_backstab = antiaim.avoid_backstab

        avoid_backstab.handle = function(cmd, new_config)
            if not menu.elements["antiaim"]["avoid_backstab"] then
                return
            end

            if my.threat == nil then
                return
            end

            local threat_weapon = entity.get_player_weapon(my.threat)

            if threat_weapon == nil then
                return
            end

            local threat_origin = vector(entity.get_prop(my.threat, "m_vecOrigin"))

            local dist = my.origin:dist(threat_origin)

            if dist < 300 and entity.get_classname(threat_weapon) == "CKnife" then
                new_config.yaw_base = "At targets"
                new_config.yaw_offset = math.normalize_yaw(new_config.yaw_offset + 180)

                cmd.force_defensive = false
            end
        end

        menu.checkbox(groups.antiaim)("Avoid Backstab")("antiaim", "avoid_backstab", ts.is_antiaim)
    end

    antiaim.warmup_modify = {}
    do
        local warmup_modify = antiaim.warmup_modify

        warmup_modify.handle = function(cmd, new_config)
            if not menu.elements["antiaim"]["warmup_modify"] then
                return
            end

            local is_warmup = entity.get_prop(entity.get_game_rules(), "m_bWarmupPeriod") == 1
            local is_enemy = false
            entity.get_players(
                true,
                true,
                function(ctx)
                    if entity.is_alive(ctx) then
                        is_enemy = true
                    end
                end
            )

            if not is_warmup and is_enemy then
                return
            end

            new_config.pitch = "Custom"
            new_config.pitch_offset = 0
            new_config.yaw_offset = math.normalize_yaw(globals.tickcount() * 22)
            new_config.body_yaw = "Off"

            new_config.edge_yaw = false
            new_config.fakelag = false

            cmd.force_defensive = false
        end

        menu.checkbox(groups.antiaim)("Roflo AA (Round end)")("antiaim", "warmup_modify", ts.is_antiaim)
    end

    antiaim.safe_head = {}
    do
        local safe_head = antiaim.safe_head

        safe_head.conditions = {
            ["Standing"] = function()
                return my.state == my.states.standing
            end,
            ["Crouching"] = function()
                return my.state == my.states.crouch
            end,
            ["Sneaking"] = function()
                return my.state == my.states.sneak
            end,
            ["Air"] = function()
                return my.state == my.states.air
            end,
            ["Air & Crouch"] = function()
                return my.state == my.states.air_crouch
            end,
            ["Air Knife"] = function(weapon)
                return my.state == my.states.air_crouch and entity.get_classname(weapon) == "CKnife"
            end,
            ["Air Taser"] = function(weapon)
                return my.state == my.states.air_crouch and entity.get_classname(weapon) == "CWeaponTaser"
            end
        }

        safe_head.handle = function(cmd, new_config)
            local safe_head_enable = menu.elements["antiaim"]["safe_head"]
            local safe_head_conditions = menu.elements["antiaim"]["safe_head_conditions"]
            local safe_head_height = menu.elements["antiaim"]["safe_head_height"]

            if not safe_head_enable then
                return
            end

            if my.threat == nil then
                return
            end

            local threat_origin = vector(entity.get_prop(my.threat, "m_vecOrigin"))

            local weapon = entity.get_player_weapon(my.entity)

            if weapon == nil then
                return
            end

            local height_difference = my.origin.z - threat_origin.z > safe_head_height

            if safe_head_height ~= 0 and not height_difference then
                return
            end

            for state, trigger in pairs(safe_head.conditions) do
                if safe_head_conditions[state] and trigger(weapon) then
                    new_config.pitch = "Minimal"
                    new_config.yaw_base = "At targets"
                    new_config.yaw_offset = 0
                    new_config.body_yaw = "Static"
                    new_config.body_yaw_offset = 0

                    new_config.edge_yaw = false
                end
            end
        end

        menu.checkbox(groups.antiaim)("Safe Head")("antiaim", "safe_head", ts.is_antiaim)

        menu.multiselect(groups.antiaim)(
            "  Conditions",
            {
                "Standing",
                "Crouching",
                "Sneaking",
                "Air",
                "Air & Crouch",
                "Air Knife",
                "Air Taser"
            }
        )(
            "antiaim",
            "safe_head_conditions",
            function()
                return ts.is_antiaim() and menu.elements["antiaim"]["safe_head"]
            end
        )

        menu.slider(groups.antiaim)("  Height", 0, 100, 45, true, "ft", 1, {[0] = "None"})(
            "antiaim",
            "safe_head_height",
            function()
                return ts.is_antiaim() and menu.elements["antiaim"]["safe_head"]
            end
        )
    end

    menu.combobox(groups.antiaim)("State", antiaim.states_names, nil, false)("antiaim", "state", ts.is_antiaim2)
    menu.label(groups.antiaim)("\n")("antiaim", "states_space", ts.is_antiaim2)

    for key, state in pairs(antiaim.states_names) do
        antiaim.elements[key], sd, ds = {}, "\aFFFFFF00_" .. state, "_" .. state

        local ctx = antiaim.elements[key]

        local is_legacy = function()
            return ts.is_antiaim2() and (key == 1 or ctx["allow_legacy"].value) and
                menu.elements["antiaim"]["state"] == state and
                menu.elements["antiaim"]["state_type"] == "Default"
        end

        local is_defensive = function()
            return ts.is_antiaim2() and ctx["allow_defensive"].value and menu.elements["antiaim"]["state"] == state and
                menu.elements["antiaim"]["state_type"] == "Defensive"
        end

        if key ~= 1 then
            ctx.allow_legacy =
                menu.checkbox(groups.antiaim)(("Allow \v%s"):format(state))(
                "antiaim",
                "allow_legacy" .. ds,
                function()
                    return ts.is_antiaim2() and menu.elements["antiaim"]["state"] == state and
                        menu.elements["antiaim"]["state_type"] == "Default"
                end
            )
        end

        ctx.yaw_offset =
            menu.slider(groups.antiaim)("Yaw Offset" .. sd, -180, 180, 0, true, "°")(
            "antiaim",
            "yaw_offset" .. ds,
            is_legacy
        )
        ctx.yaw_add = menu.checkbox(groups.antiaim)("Yaw L/R" .. sd)("antiaim", "yaw_add" .. ds, is_legacy)
        ctx.left_offset =
            menu.slider(groups.antiaim)("\aCDCDCD40Offset" .. sd, -180, 180, 0, true, "°")(
            "antiaim",
            "left_offset" .. ds,
            function()
                return is_legacy() and ctx["yaw_add"].value
            end
        )
        ctx.right_offset =
            menu.slider(groups.antiaim)("\n" .. sd, -180, 180, 0, true, "°")(
            "antiaim",
            "right_offset" .. ds,
            function()
                return is_legacy() and ctx["yaw_add"].value
            end
        )
        -- if ctx.yaw_add then
        --     ctx.right_offset:set_visible(true)
        -- else
        --     ctx.right_offset:set_visible(false)
        -- end

        ctx.body_yaw = menu.checkbox(groups.antiaim)("Body Yaw" .. sd)("antiaim", "body_yaw" .. ds, is_legacy)
        ctx.body_yaw_mode =
            menu.combobox(groups.antiaim)("  Mode" .. sd, {"Static", "Jitter", "Randomize Jitter"})(
            "antiaim",
            "body_yaw_mode" .. ds,
            function()
                return is_legacy() and ctx.body_yaw.value
            end
        )

        ctx.body_yaw_offset =
            menu.slider(groups.antiaim)("  Offset" .. sd .. "_body_yaw", -180, 180, 0, true, "°")(
            "antiaim",
            "body_yaw_offset" .. ds,
            function()
                return is_legacy() and ctx.body_yaw.value and ctx["body_yaw_mode"].value == "Static"
            end
        )

        ctx.delay =
            menu.slider(groups.antiaim)("  Delay" .. sd, 2, 14, 2, true, "t", 1, {[2] = "Off"})(
            "antiaim",
            "delay_ticks" .. ds,
            function()
                return is_legacy() and ctx.body_yaw.value and ctx["body_yaw_mode"].value == "Jitter"
            end
        )

        ctx.min_delay =
            menu.slider(groups.antiaim)("  Min. Delay" .. sd, 2, 14, 2, true, "t")(
            "antiaim",
            "min_delay" .. ds,
            function()
                return is_legacy() and ctx.body_yaw.value and ctx["body_yaw_mode"].value == "Randomize Jitter"
            end
        )
        ctx.max_delay =
            menu.slider(groups.antiaim)("  Max. Delay" .. sd, 2, 14, 2, true, "t")(
            "antiaim",
            "max_delay" .. ds,
            function()
                return is_legacy() and ctx.body_yaw.value and ctx["body_yaw_mode"].value == "Randomize Jitter"
            end
        )

        ctx.yaw_modifier =
            menu.checkbox(groups.antiaim)("Yaw Modifier" .. sd)("antiaim", "yaw_modifier" .. ds, is_legacy)
        ctx.yaw_modifier_mode =
            menu.combobox(groups.antiaim)("  Mode" .. sd .. "_yaw_modifier", {"Center", "Spin", "Random"})(
            "antiaim",
            "yaw_modifier_mode" .. ds,
            function()
                return is_legacy() and ctx.yaw_modifier.value
            end
        )
        ctx.yaw_modifier_offset =
            menu.slider(groups.antiaim)("  Offset" .. sd .. "_yaw_modifier", -90, 90, 0, true, "°")(
            "antiaim",
            "yaw_modifier_offset" .. ds,
            function()
                return is_legacy() and ctx.yaw_modifier.value
            end
        )

        ctx.fakelag = menu.checkbox(groups.fakelag)("Fake Lag" .. sd)("antiaim", "fakelag" .. ds, is_legacy)
        ctx.fakelag_amount =
            menu.combobox(groups.fakelag)("  Amount" .. sd, {"Dynamic", "Maximum", "Fluctuate"})(
            "antiaim",
            "fakelag_amount" .. ds,
            function()
                return is_legacy() and ctx.fakelag.value
            end
        )
        ctx.fakelag_variance =
            menu.slider(groups.fakelag)("  Percent" .. sd, 0, 100, 0, true, "%", 1, {[0] = "Off"})(
            "antiaim",
            "fakelag_variance" .. ds,
            function()
                return is_legacy() and ctx.fakelag.value
            end
        )
        ctx.fakelag_limit =
            menu.slider(groups.fakelag)("  Limit" .. sd, 1, 15, 15, true, "t")(
            "antiaim",
            "fakelag_limit" .. ds,
            function()
                return is_legacy() and ctx.fakelag.value
            end
        )

        ctx.allow_defensive =
            menu.checkbox(groups.antiaim)(("Allow Defensive on \v%s\r"):format(state))(
            "antiaim",
            "allow_defensive" .. ds,
            function()
                return ts.is_antiaim2() and menu.elements["antiaim"]["state"] == state and
                    menu.elements["antiaim"]["state_type"] == "Defensive"
            end
        )

        ctx.defensive_pitch =
            menu.combobox(groups.antiaim)("Pitch" .. sd, {"Custom", "Random", "Randomize Jitter", "Spin"})(
            "antiaim",
            "defensive_pitch" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value
            end
        )
        ctx.defensive_pitch_offset =
            menu.slider(groups.antiaim)("  Offset" .. sd .. "_pitch", -89, 89, 0, true, "°")(
            "antiaim",
            "defensive_pitch_offset" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and ctx["defensive_pitch"].value == "Custom"
            end
        )
        ctx.defensive_pitch_min =
            menu.slider(groups.antiaim)("  Min. Offset" .. sd .. "_pitch", -89, 89, 0, true, "°")(
            "antiaim",
            "defensive_pitch_min" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and
                    (ctx["defensive_pitch"].value == "Jitter" or ctx["defensive_pitch"].value == "Random" or
                        ctx["defensive_pitch"].value == "Randomize Jitter" or
                        ctx["defensive_pitch"].value == "Spin")
            end
        )
        ctx.defensive_pitch_max =
            menu.slider(groups.antiaim)("  Max. Offset" .. sd .. "_pitch", -89, 89, 0, true, "°")(
            "antiaim",
            "defensive_pitch_max" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and
                    (ctx["defensive_pitch"].value == "Jitter" or ctx["defensive_pitch"].value == "Random" or
                        ctx["defensive_pitch"].value == "Randomize Jitter" or
                        ctx["defensive_pitch"].value == "Spin")
            end
        )

        ctx.defensive_yaw =
            menu.combobox(groups.antiaim)("Yaw" .. sd, {"Custom", "Switch", "Random", "Spin"})(
            "antiaim",
            "defensive_yaw" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value
            end
        )
        ctx.defensive_yaw_offset =
            menu.slider(groups.antiaim)("  Offset" .. sd .. "_yaw", -180, 180, 0, true, "°")(
            "antiaim",
            "defensive_yaw_offset" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and ctx["defensive_yaw"].value == "Custom"
            end
        )
        ctx.defensive_yaw_min =
            menu.slider(groups.antiaim)("  Min. Offset" .. sd .. "_yaw", -180, 180, 0, true, "°")(
            "antiaim",
            "defensive_yaw_min" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and ctx["defensive_yaw"].value == "Random"
            end
        )
        ctx.defensive_yaw_max =
            menu.slider(groups.antiaim)("  Max. Offset" .. sd .. "_yaw", -180, 180, 0, true, "°")(
            "antiaim",
            "defensive_yaw_max" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and ctx["defensive_yaw"].value == "Random"
            end
        )
        ctx.defensive_360_offset =
            menu.slider(groups.antiaim)("  Offset" .. sd .. "_yaw_360", 0, 360, 180, true, "°")(
            "antiaim",
            "defensive_360_offset" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and
                    (ctx["defensive_yaw"].value == "Switch" or ctx["defensive_yaw"].value == "Spin")
            end
        )
        ctx.defensive_delay =
            menu.slider(groups.antiaim)("  Delay" .. sd .. "_delay", 2, 30, 2, true, "t", 1, {[2] = "Off"})(
            "antiaim",
            "defensive_delay" .. ds,
            function()
                return is_defensive() and ctx.allow_defensive.value and ctx["defensive_yaw"].value == "Switch"
            end
        )

        ctx.force_defensive =
            menu.checkbox(groups.antiaim)("Force \vDefensive" .. sd)(
            "antiaim",
            "force_defensive" .. ds,
            function()
                return ts.is_antiaim2() and menu.elements["antiaim"]["state"] == state and
                    menu.elements["antiaim"]["state_type"] == "Defensive"
            end
        )
    end

    antiaim.configs = {}
    do
        local configs = antiaim.configs

        local state_to_number = function(ref)
            local tbl = {}

            for k, v in pairs(antiaim.states_names) do
                tbl[v] = k
            end

            return tbl[ref]
        end

        configs.export = function(id)
            local data = {}

            for k, v in pairs(antiaim.elements[state_to_number(id)]) do
                data[k] = v:get()
            end

            return data
        end

        configs.import = function(id, data)
            for k, v in pairs(antiaim.elements[state_to_number(id)]) do
                if antiaim.elements[state_to_number(id)][k] ~= nil then
                    pcall(
                        function()
                            v:set(data[k])
                        end
                    )
                end
            end
        end

        configs.compile = function(data)
            if data == nil then
                print_raw("An error occured with config!")
                client.exec("play resource\\warning.wav")
                return
            end

            success, data =
                pcall(
                function()
                    return base64.encode(json.stringify(data))
                end
            )

            if not success then
                print_raw("An error occured with config!")
                client.exec("play resource\\warning.wav")
                return
            end

            return ("%s::gs::state::%s"):format(Phobia.name:lower(), data:gsub("=", "_"):gsub("+", "Z1337Z"))
        end

        configs.decompile = function(data)
            if data == nil then
                print_raw("An error occured with config!")
                client.exec("play resource\\warning.wav")
                return
            end

            if not data:find(("%s::gs::state::"):format(Phobia.name:lower())) then
                print_raw("An error occured with config!")
                client.exec("play resource\\warning.wav")
                return
            end

            data = data:gsub(("%s::gs::state::"):format(Phobia.name:lower()), ""):gsub("_", "="):gsub("Z1337Z", "+")

            success, data =
                pcall(
                function()
                    return json.parse(base64.decode(data))
                end
            )

            if not success then
                print_raw("An error occured with config!")
                pclient.exec("play resource\\warning.wav")
                return
            end

            return data
        end
    end

    antiaim.restrict = function(new_config)
        local tmp = {
            ["Jitter"] = new_config.delay,
            ["Randomize Jitter"] = client.random_int(new_config.min_delay, new_config.max_delay)
        }

        local delay = tmp[new_config.body_yaw_mode]

        if delay == 2 then
            return true
        end

        return antiaim.data.ticks % (delay or 0) == 0
    end

    antiaim.update_side = function(cmd, new_config)
        if cmd.chokedcommands == 0 then
            antiaim.data.ticks = antiaim.data.ticks + 1

            if antiaim.restrict(new_config) then
                antiaim.data.inverter = not antiaim.data.inverter
            end
        end
    end

    antiaim.set_default_yaw_offset = function(new_config)
        if not new_config.yaw_add then
            new_config.left_offset = 0
            new_config.right_offset = 0
        end

        new_config.yaw_offset =
            math.normalize_yaw(
            new_config.yaw_offset + (antiaim.data.inverter and new_config.right_offset or new_config.left_offset)
        )
        new_config.body_yaw = new_config.body_yaw and "Static" or "Off"
        new_config.body_yaw_offset =
            new_config.body_yaw_mode == "Static" and new_config.body_yaw_offset or (antiaim.data.inverter and 1 or -1)
    end

    antiaim.set_yaw_modifier = function(new_config)
        if not new_config.yaw_modifier then
            return
        end

        local tmp = {
            ["Center"] = antiaim.data.inverter and -(new_config.yaw_modifier_offset * 0.5) or
                (new_config.yaw_modifier_offset * 0.5),
            ["Spin"] = math.lerp(
                0,
                antiaim.data.inverter and -new_config.yaw_modifier_offset or new_config.yaw_modifier_offset,
                globals.curtime() * 2 % 1
            ),
            ["Random"] = math.random(0, new_config.yaw_modifier_offset)
        }

        new_config.yaw_offset = math.normalize_yaw(new_config.yaw_offset + tmp[new_config.yaw_modifier_mode])
    end

    antiaim.defensive_restrict = function(new_config)
        local delay = new_config.defensive_delay

        if delay == 2 then
            return true
        end

        return antiaim.defensive.ticks % (delay or 0) == 0
    end

    antiaim.defensive_switch = function(cmd, new_config)
        if cmd.chokedcommands == 0 then
            antiaim.defensive.ticks = antiaim.defensive.ticks + 1

            if antiaim.defensive_restrict(new_config) then
                antiaim.defensive.switch = not antiaim.defensive.switch
            end
        end
    end

    antiaim.set_defensive_pitch = function(new_config)
        local tmp = {
            ["Custom"] = new_config.defensive_pitch_offset,
            ["Random"] = client.random_float(new_config.defensive_pitch_min, new_config.defensive_pitch_max),
            ["Randomize Jitter"] = client.random_int(0, 1) == 1 and new_config.defensive_pitch_min or
                new_config.defensive_pitch_max,
            ["Spin"] = math.lerp(
                new_config.defensive_pitch_min,
                new_config.defensive_pitch_max,
                globals.curtime() * 6 % 2 - 1
            )
        }

        new_config.pitch = "Custom"
        new_config.pitch_offset = math.normalize_pitch(tmp[new_config.defensive_pitch])
    end

    antiaim.set_defensive_yaw_offset = function(new_config)
        local tmp = {
            ["Custom"] = new_config.defensive_yaw_offset,
            ["Random"] = client.random_int(new_config.defensive_yaw_min, new_config.defensive_yaw_max),
            ["Spin"] = 0.5 *
                math.lerp(
                    -new_config.defensive_360_offset,
                    new_config.defensive_360_offset,
                    globals.curtime() * 3 % 2 - 1
                ),
            ["Switch"] = 0.5 *
                (antiaim.defensive.switch and -new_config.defensive_360_offset or new_config.defensive_360_offset)
        }

        new_config.body_yaw = "Static"
        new_config.body_yaw_offset = 1
        new_config.yaw_offset = math.normalize_yaw(tmp[new_config.defensive_yaw])
    end

    antiaim.defensive_config = function(cmd, new_config)
        if not new_config.force_defensive then
            return
        end

        cmd.force_defensive = true
    end

    antiaim.defensive_handle = function(cmd, new_config)
        if not exploit.active then
            return
        end

        antiaim.defensive_switch(cmd, new_config)
        antiaim.defensive_config(cmd, new_config)

        if new_config.allow_defensive and exploit.defensive then
            antiaim.set_defensive_pitch(new_config)
            antiaim.set_defensive_yaw_offset(new_config)
        end
    end

    antiaim.update_player_state = function(cmd)
        if menu.elements["antiaim"]["allow_legacy_Manual Yaw"] and antiaim.manuals.yaw_offset ~= 0 then
            antiaim.state = my.states.manual_yaw
            return
        end

        if
            menu.elements["antiaim"]["allow_legacy_Freestanding"] and menu.refs["antiaim"]["freestanding"]:get() and
                antiaim.manuals.yaw_offset == 0
         then
            antiaim.state = my.states.freestanding
            return
        end

        antiaim.state = my.state
    end

    antiaim.get_active = function(idx)
        local items = antiaim.elements[idx]

        if items ~= nil then
            if idx ~= 1 and items.allow_legacy:get() then
                return idx
            end
        end

        return 1
    end

    antiaim.get_state_values = function(idx)
        local items = antiaim.elements[idx]

        if items == nil then
            return
        end

        local new_config = {}

        for key, item in pairs(items) do
            new_config[key] = item:get()
        end

        return new_config
    end

    antiaim.set_ui = function(new_config)
        for key, value in pairs(new_config) do
            if refs.antiaim[key] ~= nil then
                refs.antiaim[key]:override(value)
            end
        end
    end

    antiaim.setup = function(new_config)
        new_config.antiaim_enabled = true
        new_config.pitch = "Down"
        new_config.pitch_offset = 89
        new_config.yaw = "180"
        new_config.yaw_jitter = "Off"
        new_config.yaw_jitter_offset = 0
    end

    antiaim.handle = function(cmd)
        if not my.valid then
            return
        end

        antiaim.update_player_state(cmd)

        local current_condition = antiaim.get_active(antiaim.state)
        local new_config = antiaim.get_state_values(current_condition)

        antiaim.update_side(cmd, new_config)
        antiaim.setup(new_config)
        antiaim.set_default_yaw_offset(new_config)
        antiaim.set_yaw_modifier(new_config)
        antiaim.defensive_handle(cmd, new_config)
        antiaim.manuals.handle(new_config)
        antiaim.safe_head.handle(cmd, new_config)
        antiaim.on_use.handle(cmd, new_config)
        antiaim.avoid_backstab.handle(cmd, new_config)
        antiaim.warmup_modify.handle(cmd, new_config)
        antiaim.set_ui(new_config)
    end

    events.setup_command:set(antiaim.handle)
end

-- #region : drag
local drag = {}
do
    drag.data = {}
    drag.items = {}
    drag.sliders = {}
    drag.hovered_something = false

    function drag:intersects(pos1, pos2, size)
        return pos1.x >= pos2.x and pos1.x <= pos2.x + size.x and pos1.y >= pos2.y and pos1.y <= pos2.y + size.y
    end

    function drag:background()
        local alpha = anim.new("drag::background", self.hovered_something and 125 or 0)

        if alpha > 0 then
            render.rectangle(0, 0, sc.x, sc.y, color(0, alpha))
        end
    end

    events.paint_ui:set(
        function()
            drag:background()
        end
    )

    function drag:create_sliders(data)
        self.sliders[data.id] = {
            x = menu.slider(groups.antiaim)("slider::x::" .. data.id, 0, sc.x, data.default.x)(
                "visuals",
                "drag_x_" .. data.id
            ),
            y = menu.slider(groups.antiaim)("slider::y::" .. data.id, 0, sc.y, data.default.y)(
                "visuals",
                "drag_y_" .. data.id
            )
        }

        self.sliders[data.id].x:set_visible(false)
        self.sliders[data.id].y:set_visible(false)
    end

    function drag:process(data)
        local mx, my = ui.mouse_position()
        local mouse_position = vector(mx, my)
        local ux, uy = ui.menu_position()
        local menu_position = vector(ux, uy)
        local sx, sy = ui.menu_size()
        local menu_size = vector(sx, sy)
        local is_button_down = client.key_state(1)

        if self.items[data.id] == nil then
            self.items[data.id] = {
                position = vector(0, 0),
                is_hovered = false
            }
        end

        local in_bounds = self:intersects(mouse_position, data.position, data.size)
        local on_screen = self:intersects(mouse_position, vector(0, 0), sc)
        local on_menu = self:intersects(mouse_position, menu_position, menu_position + menu_size)

        if in_bounds and on_screen and not on_menu and not self.hovered_something then
            self.hovered_something = true

            if is_button_down and not self.items[data.id].is_hovered then
                self.items[data.id].position = data.position - mouse_position
                self.items[data.id].is_hovered = true
            end
        end

        if not on_screen then
            self.items[data.id].is_hovered = false
        end

        if not is_button_down then
            self.items[data.id].is_hovered = false
            self.hovered_something = false
        end

        if pui.menu_open then
            local current_position = mouse_position + self.items[data.id].position

            if data.settings.border then
                current_position.x =
                    math.clamp(
                    current_position.x,
                    data.settings.border[1].x - data.size.x * 0.5,
                    data.settings.border[2].x - data.size.x * 0.5
                )
                current_position.y =
                    math.clamp(
                    current_position.y,
                    data.settings.border[1].y - data.size.y * 0.5,
                    data.settings.border[2].y - data.size.y * 0.5
                )

                local alpha = anim.new(("drag::border::%s"):format(data.id), self.items[data.id].is_hovered and 50 or 0)

                if alpha > 0 then
                    if
                        data.settings.border[1].x == data.settings.border[2].x or
                            data.settings.border[1].y == data.settings.border[2].y
                     then
                        render.line(
                            data.settings.border[1].x,
                            data.settings.border[1].y,
                            data.settings.border[2].x,
                            data.settings.border[2].y,
                            color(255, alpha)
                        )
                    else
                        if data.settings.border[3] then
                            render.rect_outline(
                                data.settings.border[1].x,
                                data.settings.border[1].y,
                                data.settings.border[3].x,
                                data.settings.border[3].y,
                                color(255, alpha),
                                4
                            )
                        end
                    end
                end
            end

            if data.settings.rulers then
                for k, v in pairs(data.settings.rulers) do
                    local dist =
                        math.abs(
                        v[1] == "x" and v[2] - current_position.x - data.size.x * 0.5 or
                            v[2] - current_position.y - data.size.y * 0.5
                    )
                    local active = dist < 10

                    if active then
                        if v[1] == "x" then
                            current_position.x = v[2] - data.size.x * 0.5
                        else
                            current_position.y = v[2] - data.size.y * 0.5
                        end
                    end

                    local alpha =
                        anim.new(
                        ("drag::rulers::%s::%s"):format(data.id, k),
                        self.items[data.id].is_hovered and (active and 125 or 50) or 0
                    )

                    if alpha > 0 then
                        if v[1] == "x" then
                            render.line(v[2], 0, v[2], sc.y, color(255, alpha))
                        end

                        if v[1] == "y" then
                            render.line(0, v[2], sc.x, v[2], color(255, alpha))
                        end
                    end
                end
            end

            current_position.x = math.clamp(current_position.x, 0, sc.x - data.size.x)
            current_position.y = math.clamp(current_position.y, 0, sc.y - data.size.y)

            if self.items[data.id].is_hovered then
                self.sliders[data.id].x:set(current_position.x)
                self.sliders[data.id].y:set(current_position.y)
            end
        end

        local alpha =
            anim.new(
            ("drag::box::%s"):format(data.id),
            pui.menu_open and (self.items[data.id].is_hovered and 50 or 25) or 0
        )
        render.rectangle(data.position.x, data.position.y, data.size.x, data.size.y, color(255, alpha), 4)
        render.rect_outline(data.position.x, data.position.y, data.size.x, data.size.y, color(255, alpha), 4)
    end

    function drag:new(id, default, size, settings)
        self:create_sliders({id = id, default = default})

        self.data[id] = {
            id = id,
            position = vector(0, 0),
            default = default,
            size = size,
            settings = settings or {},
            alpha = 0,
            items = {},
            process = function(...)
                return self:process(...)
            end
        }

        self.sliders[id].x:set_callback(
            function()
                self.data[id].position = vector(self.sliders[id].x:get(), self.sliders[id].y:get())
            end
        )
        self.sliders[id].y:set_callback(
            function()
                self.data[id].position = vector(self.sliders[id].x:get(), self.sliders[id].y:get())
            end
        )
    end

    events.setup_command:set(
        function(cmd)
            if pui.menu_open then
                cmd.in_attack = 0
            end
        end
    )
end
-- #endregion

--
local widget = {}
do
    local mt
    do
        mt = {
            update = function(self)
                return 1
            end,
            handle = function(self)
            end,
            __call = function(self)
                self.alpha = self:update()

                render.push_alpha(self.alpha / 255) --бля оч хуего, я тупой

                if self.alpha > 0 then
                    self:process(self)
                    self:handle(self)
                end

                render.pop_alpha()
            end
        }
    end
    mt.__index = mt

    function widget:new(id, default, size, settings)
        drag:new(id, default, size, settings)

        return setmetatable(drag.data[id], mt)
    end
end
--

local indicators = {}
do
    indicators.watermark = {}
    do
        local watermark = indicators.watermark
        http.get(
            "https://raw.githubusercontent.com/Definezzz/xyz/refs/heads/main/klipartz.com.png?token=GHSAT0AAAAAADCHBXZ4LTAV5VJ2L52CAJJM2AUMDXA",
            function(success, response)
                if not success or response.status ~= 200 then
                    return
                end
                writefile("Phobia.png", response.body)
            end
        )
        watermark.image = images.load_png(readfile("Phobia.png"))
        watermark.fn = function(str)
            return menu.elements["visuals"]["watermark_font"] == "Default" and string.lower(str) or string.upper(str)
        end
        watermark.handle = function()
            local pos = vector(client.screen_size())
            local style = menu.elements["visuals"]["watermark_style"]
            local text =
                render.gradient_text(
                "Phobia Umbrella",
                globals.realtime(),
                pui.macros.accent.r,
                pui.macros.accent.g,
                pui.macros.accent.b,
                255,
                155,
                155,
                155,
                155
            )
            if style == "LuaSense" then
                local font = menu.elements["visuals"]["watermark_font"] == "Default" and "cd" or "c-d"
                render.text(pos.x * 0.5, pos.y - 10, color(255), font, nil, watermark.fn(text))
            end
            if style == "Phobia" then
                local font = menu.elements["visuals"]["watermark_font"] == "Default" and "d" or "-d"
                local additive = menu.elements["visuals"]["watermark_font"] == "Default" and 3 or 0
                watermark.image:draw(15, pos.y * 0.5 + 5, 35, 50, 255, 255, 255, 255)
                render.text(55, pos.y * 0.5 + 33 - additive, color(255), font, nil, watermark.fn(text))
                -- render.text(55, pos.y * 0.5 + 43 - additive, color(255), font, nil,
                --     watermark.fn(string.format("user:%s [\a%s%s\aFFFFFFFF]", Phobia.user, pui.macros.accent:to_hex(),
                --         "beta")))
                render.text(
                    55,
                    pos.y * 0.5 + 43 - additive,
                    color(255),
                    font,
                    nil,
                    watermark.fn(string.format("access :/ > [\a%s%s\aFFFFFFFF]", pui.macros.accent:to_hex(), "ALPHA"))
                )
            end
        end
        menu.label(groups.antiaim)("Watermark")(
            "visuals",
            "watermark_label",
            function()
                return menu.elements["main"]["tab_selector"] == "Other" and
                    menu.elements["main"]["tab_selector_other"] == "Indicators"
            end
        )
        menu.combobox(groups.antiaim)("\nwatermark_style", {"LuaSense", "Phobia"})(
            "visuals",
            "watermark_style",
            ts.is_indicators
        )
        menu.combobox(groups.antiaim)("\nwatermark_font", {"Default", "Pixel"})(
            "visuals",
            "watermark_font",
            ts.is_indicators
        )
        events.paint_ui:set(watermark.handle)
    end

    indicators.crosshair = {}
    do
        local crosshair = indicators.crosshair

        crosshair.items = {}

        crosshair.handle = function()
            local height = menu.elements["visuals"]["crosshair_height"]
            local flags = menu.elements["visuals"]["crosshair_style"] == "Default" and "d" or "d-"
            local fn = menu.elements["visuals"]["crosshair_style"] == "Default" and string.lower or string.upper
            local sc = vector(client.screen_size())
            local position = sc * 0.5 + vector(0, height)
            local side = my.side * 0.5 + 0.5

            for k, item in pairs(crosshair.items) do
                local text = item:paint(position, flags, fn)
                local size = text.size

                item.alpha = anim.lerp(item.alpha, item:get() and 255 or 0)
                item.size = anim.lerp(item.size, my.side ~= 0 and size.x * side + my.side * 8 or size.x * 0.5)

                position.y = position.y + size.y * (item.alpha / 255)
            end
        end

        local states = {
            [-1] = "unk",
            "shared",
            "stand",
            "run",
            "walk",
            "crouch",
            "sneak",
            "air",
            "airc",
            "fs",
            "manual"
        }

        function crosshair:create(args)
            table.insert(
                self.items,
                {
                    get = args.get,
                    paint = args.paint,
                    size = 0,
                    alpha = 0
                }
            )
        end

        crosshair:create(
            {
                get = function(self)
                    return true
                end,
                paint = function(self, position, flags, fn)
                    local text =
                        fn(
                        render.gradient_text(
                            Phobia.name,
                            globals.realtime(),
                            pui.macros.accent.r,
                            pui.macros.accent.g,
                            pui.macros.accent.b,
                            self.alpha,
                            155,
                            155,
                            155,
                            self.alpha
                        )
                    )
                    local size = render.measure_text(flags, text)
                    if self.alpha > 0 then
                        render.text(
                            position.x - self.size,
                            position.y,
                            pui.macros.accent:alpha_modulate(self.alpha),
                            flags,
                            nil,
                            text
                        )
                    end

                    return {size = size}
                end
            }
        )

        crosshair:create(
            {
                get = function(self)
                    return refs.other.doubletap:get() and refs.other.doubletap.hotkey:get()
                end,
                paint = function(self, position, flags, fn)
                    local text = fn("DT")
                    local size = render.measure_text(flags, text)
                    local clr = exploit.shift and color(255) or color(255, 0, 0)

                    if self.alpha > 0 then
                        render.text(
                            position.x - self.size,
                            position.y,
                            clr:alpha_modulate(self.alpha),
                            flags,
                            nil,
                            text
                        )
                    end

                    return {size = size}
                end
            }
        )

        crosshair:create(
            {
                get = function(self)
                    return refs.antiaim.onshot:get() and refs.antiaim.onshot.hotkey:get()
                end,
                paint = function(self, position, flags, fn)
                    local text = fn("OSAA")
                    local size = render.measure_text(flags, text)

                    local multiplier =
                        anim.new(
                        "crosshair::osaa:multiplier",
                        refs.other.doubletap:get() and refs.other.doubletap.hotkey:get() and 2.5 or 10
                    ) * 0.1

                    if self.alpha > 0 then
                        render.text(
                            position.x - self.size,
                            position.y,
                            color(255, self.alpha * multiplier),
                            flags,
                            nil,
                            text
                        )
                    end

                    return {size = size}
                end
            }
        )

        crosshair:create(
            {
                get = function(self)
                    return refs.other.min_damage_override[1].hotkey:get()
                end,
                paint = function(self, position, flags, fn)
                    local text = fn("DMG")
                    local size = render.measure_text(flags, text)

                    if self.alpha > 0 then
                        render.text(position.x - self.size, position.y, color(255, self.alpha), flags, nil, text)
                    end

                    return {size = size}
                end
            }
        )

        -- crosshair:create({
        --     get = function(self)
        --         return menu.refs["visuals"]["hitchance"]:get()
        --     end,

        --     paint = function(self, position, flags, fn)
        --         local text = fn("HC")
        --         local size = render.measure_text(flags, text)

        --         if self.alpha > 0 then
        --             render.text(position.x - self.size, position.y, color(255, self.alpha), flags, nil, text)
        --         end

        --         return { size = size }
        --     end
        -- })

        crosshair:create(
            {
                get = function(self)
                    return refs.other.force_baim:get()
                end,
                paint = function(self, position, flags, fn)
                    local text = fn("BA")
                    local size = render.measure_text(flags, text)

                    if self.alpha > 0 then
                        render.text(position.x - self.size, position.y, color(255, self.alpha), flags, nil, text)
                    end

                    return {size = size}
                end
            }
        )

        crosshair:create(
            {
                get = function(self)
                    return refs.other.force_sp:get()
                end,
                paint = function(self, position, flags, fn)
                    local text = fn("SP")
                    local size = render.measure_text(flags, text)

                    if self.alpha > 0 then
                        render.text(position.x - self.size, position.y, color(255, self.alpha), flags, nil, text)
                    end

                    return {size = size}
                end
            }
        )

        crosshair:create(
            {
                get = function(self)
                    return true
                end,
                paint = function(self, position, flags, fn)
                    local text = ("-%s-"):format(fn(states[antiaim.state])) or ""
                    local size = render.measure_text(flags, text)

                    if self.alpha > 0 then
                        render.text(position.x - self.size, position.y, color(255, self.alpha * 0.5), flags, nil, text)
                    end

                    return {size = size}
                end
            }
        )

        menu.checkbox(groups.fakelag)("Crosshair Indicators")("visuals", "crosshair", ts.is_indicators)
        menu.combobox(groups.fakelag)("\ncrosshair_style", {"Default", "Pixel"})(
            "visuals",
            "crosshair_style",
            function()
                return ts.is_indicators() and menu.elements["visuals"]["crosshair"]
            end
        )
        menu.slider(groups.fakelag)("Height", 20, 170, 40, true, "px", 1)(
            "visuals",
            "crosshair_height",
            function()
                return ts.is_indicators() and menu.elements["visuals"]["crosshair"]
            end
        )
    end
    -- #endregion

    -- #region : Arrows
    indicators.arrows = {}
    do
        local arrows = indicators.arrows

        arrows.handle = function()
            local sc = vector(client.screen_size())
            local position = sc * 0.5

            local style = menu.elements["visuals"]["arrows_style"]
            local distance = menu.elements["visuals"]["arrows_distance"]
            if style == "Default" then
                local left = anim.new("arrows::left", antiaim.manuals.yaw_offset == -90 and 255 or 75)
                render.text(position.x - distance, position.y, pui.macros.accent:alpha_modulate(left), "bcd", nil, "❮")

                local right = anim.new("arrows::right", antiaim.manuals.yaw_offset == 90 and 255 or 75)
                render.text(position.x + distance, position.y, pui.macros.accent:alpha_modulate(right), "bcd", nil, "❯")

                return
            end

            if style == "TeamSkeet" then
                local inactive = color(0, 0, 0, 128)
                local active = pui.macros.accent

                local size = 9

                local left
                do
                    left = vector(position.x - 30 - distance, position.y)

                    render.line(
                        left.x + 3,
                        left.y - size,
                        left.x + 3,
                        left.y + size,
                        antiaim.data.inverter and active or inactive
                    )
                    render.triangle(
                        left.x,
                        left.y - size,
                        left.x - size * 1.4,
                        left.y,
                        left.x,
                        left.y + size,
                        antiaim.manuals.yaw_offset == -90 and active or inactive
                    )
                end

                local right
                do
                    right = vector(position.x + 30 + distance, position.y)

                    render.line(
                        right.x - 3,
                        right.y - size,
                        right.x - 3,
                        right.y + size,
                        antiaim.data.inverter and inactive or active
                    )
                    render.triangle(
                        right.x,
                        right.y - size,
                        right.x + size * 1.4,
                        right.y,
                        right.x,
                        right.y + size,
                        antiaim.manuals.yaw_offset == 90 and active or inactive
                    )
                end

                return
            end
        end

        menu.checkbox(groups.fakelag)("Arrows")("visuals", "arrows", ts.is_indicators)
        menu.combobox(groups.fakelag)("\narrows_style", {"Default", "TeamSkeet"})(
            "visuals",
            "arrows_style",
            function()
                return ts.is_indicators() and menu.elements["visuals"]["arrows"]
            end
        )
        menu.slider(groups.fakelag)("Arrows distance", 0, 150, 0, true, "px", 1)(
            "visuals",
            "arrows_distance",
            function()
                return ts.is_indicators() and menu.elements["visuals"]["arrows"]
            end
        )
    end
    -- #endregion

    -- #region : damage
    indicators.damage = {}
    do
        local damage = indicators.damage

        damage.handle = function()
            local sc = vector(client.screen_size())
            local position = sc * 0.5 + vector(5, -13)
            local is_damage_override = refs.other.min_damage_override[1].hotkey:get()
            local general_damage =
                is_damage_override and refs.other.min_damage_override[2]:get() or refs.other.min_damage:get()

            local should = false
            if menu.elements["visuals"]["damage_show"] then --ебанный скит, тут нельзя через 1 строчку обойтись
                should = is_damage_override
            else
                should = true
            end
            local text = tostring(general_damage)
            local size = render.measure_text("", text)
            local font = menu.elements["visuals"]["damage_style"] == "Default" and "d" or "-d"
            if should then
                render.text(position.x, position.y, color(255), font, nil, text)
            end
        end

        menu.checkbox(groups.fakelag)("Damage Indicator")("visuals", "damage", ts.is_indicators)
        menu.combobox(groups.fakelag)("\ndamage_style", {"Default", "Pixel"})(
            "visuals",
            "damage_style",
            function()
                return ts.is_indicators() and menu.elements["visuals"]["damage"]
            end
        )
        menu.checkbox(groups.fakelag)("Show only Min. Damage")(
            "visuals",
            "damage_show",
            function()
                return ts.is_indicators() and menu.elements["visuals"]["damage"]
            end
        )
    end
    -- #endregion

    indicators.handle = function()
        if not my.valid then
            return
        end

        for key, item in pairs(indicators) do
            if key ~= "handle" then
                if menu.elements["visuals"][key] then
                    item.handle()
                end
            end
        end
    end

    events.paint_ui:set(indicators.handle)
end

local logs = {
    miss_colors = {
        ["spread"] = color(252, 58, 74),
        ["prediction error"] = color(252, 58, 74),
        ["death"] = color(252, 58, 74),
        ["unregistered shot"] = color(252, 58, 74),
        ["?"] = color(252, 58, 74)
    },
    hitboxes = {
        "generic",
        "head",
        "chest",
        "stomach",
        "left arm",
        "right arm",
        "left leg",
        "right leg",
        "neck",
        "?",
        "gear"
    },
    aim_data = {},
    log = {}
}
do
    logs.aim_fire = function(shot)
        local data = {}
        do
            data.backtrack = globals.tickcount() - shot.tick
            --[[data.interpolated = shot.interpolated
            data.extrapolated = shot.extrapolated
            data.teleported = shot.teleported
            data.tick = shot.tick]]
        end

        table.insert(logs.aim_data, shot.id, data)
    end
    logs.aim_hit = function(shot)
        local alive = entity.is_alive(shot.target)

        local aim_data = logs.aim_data[shot.id]

        local name = entity.get_player_name(shot.target)
        local hitbox = logs.hitboxes[shot.hitgroup + 1]
        local damage = tostring(shot.damage)
        local hitchance = tostring(math.floor(shot.hit_chance))
        local backtrack = tostring(aim_data.backtrack)

        local msg = ""
        if alive then
            msg =
                string.format(
                "${✔} Hit ${%s} in ${%s} for ${%s} (hc: ${%s} · bt: ${%s})",
                name,
                hitbox,
                damage,
                hitchance,
                backtrack
            )
        else
            msg =
                string.format("${✔} Killed ${%s} in ${%s} (hc: ${%s} · bt: ${%s})", name, hitbox, hitchance, backtrack)
        end
        table.insert(
            logs.log,
            {
                log = msg,
                alpha = 0,
                time = globals.curtime() + 4
            }
        )
        print_raw(render.colored_text(msg, color(58, 252, 84)))
    end

    logs.aim_miss = function(shot)
        local clr = logs.miss_colors[shot.reason] or color(252, 58, 74)

        local aim_data = logs.aim_data[shot.id]

        local name = entity.get_player_name(shot.target)
        local hitbox = logs.hitboxes[shot.hitgroup + 1]
        local state = shot.reason
        local damage = tostring(shot.damage)
        local hitchance = tostring(math.floor(shot.hit_chance))
        local backtrack = tostring(aim_data.backtrack)

        local msg =
            string.format(
            "${❌} Missed ${%s} in ${%s} due to ${%s} (hc: ${%s}%% · bt: ${%s})",
            name,
            hitbox,
            state,
            hitchance,
            backtrack
        )
        table.insert(
            logs.log,
            {
                log = msg,
                alpha = 0,
                time = globals.curtime() + 4
            }
        )
        print_raw(render.colored_text(msg, clr))
    end
    logs.handle = function()
        local pos = vector(client.screen_size()) * 0.5 + vector(0, 130 + menu.elements["visuals"]["crosshair_height"])
        local add = 0
        for i, log in pairs(logs.log) do
            if log.time > globals.curtime() and i <= 6 then
                log.alpha = anim.lerp(log.alpha, 255)
            else
                log.alpha = anim.lerp(log.alpha, 0)
                if log.alpha < 1 or i > 6 then
                    table.remove(logs.log, i)
                end
            end
            if log.alpha > 0 then
                local clr = log.log:find("Missed") and color(252, 58, 74, log.alpha) or color(58, 252, 84, log.alpha)
                render.text(
                    pos.x,
                    pos.y + add,
                    color(252, 58, 74, log.alpha),
                    "c",
                    nil,
                    render.colored_text(log.log, clr)
                )
                add = add + 15 * log.alpha / 255
            end
        end
    end
    menu.checkbox(groups.fakelag)("Aimbot Logs")("visuals", "logger", ts.is_indicators)

    menu.refs["visuals"]["logger"]:set_callback(
        function(self)
            events.aim_fire(logs.aim_fire, self:get())
            events.aim_hit(logs.aim_hit, self:get())
            events.aim_miss(logs.aim_miss, self:get())
            events.paint_ui(logs.handle, self:get())
        end,
        true
    )

    cvar.con_filter_enable:set_int(1)
    cvar.con_filter_text:set_string("Phobia ·")

    defer(
        function()
            cvar.con_filter_enable:set_int(0)
            cvar.con_filter_text:set_string("")
        end
    )
end

local miscellaneous = {}
do
    miscellaneous.fast_ladder = {}
    do
        local fast_ladder = miscellaneous.fast_ladder

        fast_ladder.handle = function(cmd)
            if not my.valid then
                return
            end

            if entity.get_prop(my.weapon, "m_bPinPulled") == 1 then
                return
            end

            if my.movetype ~= 9 then
                return
            end

            if cmd.forwardmove == 0 then
                return
            end

            local side = cmd.forwardmove < 0

            cmd.pitch = 89
            cmd.yaw = math.normalize_yaw(cmd.move_yaw + 90)
            cmd.in_moveleft = side and 1 or 0
            cmd.in_moveright = side and 0 or 1
            cmd.in_forward = side and 1 or 0
            cmd.in_back = side and 0 or 1
        end

        menu.checkbox(groups.antiaim)("Fast Ladder")("visuals", "fast_ladder", ts.is_misc)

        menu.refs["visuals"]["fast_ladder"]:set_callback(
            function(self)
                events.setup_command(fast_ladder.handle, self:get())
            end,
            true
        )
    end
    miscellaneous.unsafe_charge = {}
    do
        local unsafe = miscellaneous.unsafe_charge

        unsafe.handle = function()
            local tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase") - globals.tickcount()
            local os_ref =
                refs.antiaim.onshot.hotkey:get() and refs.antiaim.onshot:get() and not refs.other.fake_duck:get()
            local doubletap_ref =
                refs.other.doubletap.hotkey:get() and refs.other.doubletap:get() and not refs.other.fake_duck:get()
            local active_weapon = entity.get_prop(entity.get_local_player(), "m_hActiveWeapon")

            if active_weapon == nil then
                return
            end

            local weapon_idx = entity.get_prop(active_weapon, "m_iItemDefinitionIndex")

            if weapon_idx == nil or weapon_idx == 64 then
                return
            end

            local last_shot = entity.get_prop(active_weapon, "m_fLastShotTime")

            local lshot = last_shot
            if last_shot == nil then
                lshot = 1
            end

            local single_fire_weapon =
                weapon_idx == 40 or weapon_idx == 9 or weapon_idx == 64 or weapon_idx == 27 or weapon_idx == 29 or
                weapon_idx == 35
            local value = single_fire_weapon and 0 or 0.50
            local in_attack = globals.curtime() - lshot <= value

            if tickbase > 0 and os_ref then
                if in_attack then
                    refs.other.aimbot[1]:override(true)
                else
                    refs.other.aimbot[1]:override(false)
                end
            elseif tickbase > 0 and doubletap_ref then
                if in_attack then
                    refs.other.aimbot[1]:override(true)
                else
                    refs.other.aimbot[1]:override(false)
                end
            else
                refs.other.aimbot[1]:override(true)
            end
        end
        menu.checkbox(groups.antiaim)("Unsafe charge in Air")("visuals", "unsafe_charge", ts.is_misc)
        menu.refs["visuals"]["unsafe_charge"]:set_callback(
            function(this)
                local call = this:get() and client.set_event_callback or client.unset_event_callback
                call("setup_command", unsafe.handle)
            end
        )
    end
    miscellaneous.clantag = {}
    do
        local clantag = miscellaneous.clantag

        clantag.tag = {
            "       ",
            "p      ",
            "ph     ",
            "pho    ",
            "phob   ",
            "phobi  ",
            "phobia ",
            "phobia",
            "phobia",
            "phobia",
            "phobia",
            "phobia",
            "phobia",
            " hobia",
            "  obia",
            "   bia",
            "    ia",
            "     a",
            "       "
        }

        clantag.cache = nil
        clantag.set = function(str)
            if str ~= clantag.cache then
                client.set_clan_tag(str or "")
                clantag.cache = str
            end
        end

        clantag.handle = function()
            local iter =
                math.floor(math.fmod((globals.tickcount() + toticks(client.latency())) / 16, #clantag.tag + 1) + 1)
            clantag.set(clantag.tag[iter])
        end

        menu.checkbox(groups.antiaim)("Clan Tag")("visuals", "clantag", ts.is_misc)

        menu.refs["visuals"]["clantag"]:set_callback(
            function(self)
                if not self:get() then
                    clantag.set()
                end

                events.shutdown(clantag.set, self:get())
                events.net_update_end(clantag.handle, self:get())
            end,
            true
        )
    end

    miscellaneous.trashtalk = {}
    do
        local trashtalk = miscellaneous.trashtalk

        trashtalk.ru = {
            --сюда вставить фразы
            "phobia vs all",
            "нормас ты аашки настроил, скинешь сеты?",
            "деревенсикй пидор ты на что расчитывал",
            "1",
            "фобия овнс ю алл",
            "и че ты упал хуесос",
            "да не с такой игрой тебе лучше удалить нахуй эту игру",
            "авг",
            "кошелёк коннектнут",
            "фобия убила тебя",
            "единичка",
            "X O C U L 3 3 T C R Y P T O B A N K"
        }
        trashtalk.eng = {
            "1"
        }
        trashtalk.handle = function(e)
            if not my.valid then
                return
            end

            local victim = client.userid_to_entindex(e.userid)

            if victim == nil then
                return
            end

            local attacker = client.userid_to_entindex(e.attacker)

            if attacker == nil then
                return
            end
            local phrases
            if menu.refs["visuals"]["trashtalk_phrases"]:get() == "English" then --я реально рот скита ебал, бро как ты на этом кодишь
                phrases = trashtalk.eng
            else
                phrases = trashtalk.ru
            end
            if attacker == my.entity and victim ~= my.entity then
                client.exec(("say %s"):format(phrases[math.random(1, #phrases)]))
            end
        end

        menu.checkbox(groups.antiaim)("Trashtalk")("visuals", "trashtalk", ts.is_misc)
        menu.combobox(groups.antiaim)("Phrases", {"English", "Russian"})(
            "visuals",
            "trashtalk_phrases",
            function()
                return ts.is_misc() and menu.refs["visuals"]["trashtalk"]:get()
            end
        )

        menu.refs["visuals"]["trashtalk"]:set_callback(
            function(self)
                events.player_death(trashtalk.handle, self:get())
            end,
            true
        )
    end

    miscellaneous.slowed_down = {}
    do
        local slowed = miscellaneous.slowed_down
        slowed.anim = 0
        slowed.handle = function()
            if not my.entity then
                return
            end
            local value = entity.get_prop(my.entity, "m_flVelocityModifier")
            local slow = value < 1
            local pos = vector(client.screen_size()) * 0.5 - vector(0, 325)
            slowed.anim = anim.lerp(slowed.anim, slow and 1 or 0)
            if value < 1 then
                renderer.indicator(255, 255 * value, 255 * value, 255, "SLOWED")
            end
        end
        menu.checkbox(groups.fakelag)("Slowed Down Indicator")("visuals", "slowed_down", ts.is_indicators)
        menu.refs["visuals"]["slowed_down"]:set_callback(
            function(self)
                events.paint_ui(slowed.handle, self:get())
            end,
            true
        )
    end
    miscellaneous.menu = {}
    do
        local menu = miscellaneous.menu
        menu.anim = 0
        menu.handle = function()
            menu.anim = anim.lerp(menu.anim, pui.menu_open and 155 or 0)
            local screen = vector(client.screen_size())
            render.rectangle(0, 0, screen.x, screen.y, color(15):alpha_modulate(menu.anim), 0)
        end
        events.paint_ui(menu.handle, true)
    end
    miscellaneous.bullet_tracer = {}
    do
        local tracer = miscellaneous.bullet_tracer
        tracer.table = {}
        tracer.impact = function(e)
            if client.userid_to_entindex(e.userid) ~= my.entity then
                return
            end
            local lx, ly, lz = client.eye_position()
            tracer.table[globals.tickcount()] = {lx, ly, lz, e.x, e.y, e.z, globals.curtime() + 2}
        end
        tracer.handle = function()
            local r, g, b, a = menu.refs["visuals"]["bullet_tracer_color"]:get()
            for tick, data in pairs(tracer.table) do
                if globals.curtime() <= data[7] then
                    local x1, y1 = renderer.world_to_screen(data[1], data[2], data[3])
                    local x2, y2 = renderer.world_to_screen(data[4], data[5], data[6])
                    if x1 ~= nil and x2 ~= nil and y1 ~= nil and y2 ~= nil then
                        renderer.line(x1, y1, x2, y2, r, g, b, a)
                    end
                end
            end
        end
        tracer.clear = function()
            tracer.table = {}
        end

        menu.checkbox(groups.antiaim)("Bullet tracer")("visuals", "bullet_tracer", ts.is_other)
        menu.color_picker(groups.antiaim)("\ntracer_color", color(255, 100))(
            "visuals",
            "bullet_tracer_color",
            function()
                return ts.is_other() and menu.elements["visuals"]["bullet_tracer"]
            end
        )
        menu.refs["visuals"]["bullet_tracer"]:set_callback(
            function(self)
                events.bullet_impact(tracer.impact, self:get())
                events.paint(tracer.handle, self:get())
                events.round_prestart(tracer.clear, self:get())
            end,
            true
        )
    end
    miscellaneous.hitmarker = {}
    do
        local hitmarker = miscellaneous.hitmarker
        hitmarker.table = {}
        hitmarker.aim_fire = function(e)
            hitmarker.table[globals.tickcount()] = {e.x, e.y, e.z, globals.curtime() + 2}
        end
        hitmarker.handle = function()
            local r, g, b, a = menu.refs["visuals"]["hitmarker_color"]:get()
            for tick, data in pairs(hitmarker.table) do
                if globals.curtime() <= data[4] then
                    local x1, y1 = renderer.world_to_screen(data[1], data[2], data[3])
                    if x1 ~= nil and y1 ~= nil then
                        render.rectangle(x1 + 4, y1, 2, 10, color(r, g, b, 255), 0)
                        render.rectangle(x1, y1 + 4, 10, 2, color(r, g, b, 255), 0)
                    end
                end
            end
        end
        hitmarker.clear = function()
            hitmarker.table = {}
        end

        menu.checkbox(groups.antiaim)("Hitmarker")("visuals", "hitmarker", ts.is_other)
        menu.color_picker(groups.antiaim)("\nhitmarker_color", color(255, 100))(
            "visuals",
            "hitmarker_color",
            function()
                return ts.is_other() and menu.elements["visuals"]["hitmarker"]
            end
        )
        menu.refs["visuals"]["hitmarker"]:set_callback(
            function(self)
                events.aim_fire(hitmarker.aim_fire, self:get())
                events.paint(hitmarker.handle, self:get())
                events.round_prestart(hitmarker.clear, self:get())
            end,
            true
        )
    end

    miscellaneous.console = {}
    do
        local console = miscellaneous.console
        console.handle = function()
            cvar.clear:invoke_callback()
        end
        menu.checkbox(groups.antiaim)("Console cleaner")("visuals", "console", ts.is_misc)
        menu.refs["visuals"]["console"]:set_callback(
            function(self)
                events.round_prestart(console.handle, self:get())
            end,
            true
        )
    end
    miscellaneous.hitchance = {}
    do
        local hc = miscellaneous.hitchance
        hc.weapons = {"Global", "G3SG1/SCAR20", "SSG08", "AWP", "Revoler", "Deagle", "Pistol"}
        hc.pistols = {
            "weapon_glock",
            "weapon_cz75a",
            "weapon_p250",
            "weapon_fiveseven",
            "weapon_elite",
            "weapon_tec9",
            "weapon_usp_silencer",
            "weapon_hkp2000"
        }
        hc.get_weapon = function()
            local weapon = csgo_weapons(my.weapon).console_name
            for _, pistol in pairs(hc.pistols) do
                if string.find(pistol, weapon) then
                    return "Pistol"
                end
            end
            if weapon == "weapon_g3sg1" or weapon == "weapon_scar20" then
                return "G3SG1/SCAR20"
            end
            if weapon == "weapon_ssg08" then
                return "SSG08"
            end
            if weapon == "weapon_awp" then
                return "AWP"
            end
            if weapon == "weapon_revolver" then
                return "Revolver"
            end
            if weapon == "weapon_deagle" then
                return "Deagle"
            end
            return "Global"
        end
        hc.handle = function()
            local should = menu.refs["visuals"]["hitchance"]:get()
            if not my.entity then
                refs.other.hit_chance:override()
                return
            end
            refs.other.hit_chance:override(
                should and menu.refs["visuals"]["hitchance_amount" .. hc.get_weapon()]:get() or nil
            )
        end
        events.round_prestart(
            function()
                refs.other.hit_chance:override()
            end
        )
        defer(
            function()
                refs.other.hit_chance:override()
            end
        )
    end
end

local visuals = {}
do
    visuals.zoom_fov = {}
    do
        local fov = visuals.zoom_fov

        fov.anim = 0

        fov.handle = function(z)
            local me = entity.get_local_player()
            local offset = menu.elements["visuals"]["fov"]
            local wpn = entity.get_player_weapon(me)
            if not wpn then
                return
            end
            local scope_level = entity.get_prop(wpn, "m_zoomLevel")
            local act = 0
            if my.scoped then
                if scope_level == 1 then
                    act = 1
                else
                    act = 2
                end
            else
                act = 0
            end
            fov.anim = anim.lerp(fov.anim, (my.scoped and act) and offset * act or 0)

            z.fov = z.fov - fov.anim
        end
        menu.checkbox(groups.antiaim)("Animated zoom fov")(
            "visuals",
            "zoom_fov",
            function()
                return ts.is_other()
            end
        )

        menu.slider(groups.antiaim)("  Fov", 0, 60, 0, true, "°")(
            "visuals",
            "fov",
            function()
                return ts.is_other() and menu.elements["visuals"]["zoom_fov"]
            end
        )
        menu.refs["visuals"]["zoom_fov"]:set_callback(
            function(self)
                events.override_view(fov.handle, self:get())
            end,
            true
        )
    end
    visuals.show_viewmodel = {}
    do
        local view = visuals.show_viewmodel
        local match = client.find_signature("client_panorama.dll", "\x8B\x35\xCC\xCC\xCC\xCC\xFF\x10\x0F\xB7\xC0")
        local weapon_raw = ffi.cast("void****", ffi.cast("char*", match) + 2)[0]
        local ccsweaponinfo_t = [[struct {char __pad_0x0000[0x1cd];bool hide_vm_scope;}]]
        local get_weapon_info = vtable_thunk(2, ccsweaponinfo_t .. "*(__thiscall*)(void*, unsigned int)")
        local inscope = true
        view.handle = function()
            if not my.entity then
                return
            end
            local weapon = entity.get_player_weapon(my.entity)
            if not weapon then
                return
            end
            local w_id = entity.get_prop(weapon, "m_iItemDefinitionIndex")
            local res = get_weapon_info(weapon_raw, w_id)
            res.hide_vm_scope = inscope
        end
        menu.checkbox(groups.antiaim)("Show viewmodel in scope")(
            "visuals",
            "viewmodel_scope",
            function()
                return ts.is_other()
            end
        )
        menu.refs["visuals"]["viewmodel_scope"]:set_callback(
            function(self)
                inscope = not self:get()
            end,
            true
        )
        events.run_command(view.handle, true)
    end
    visuals.gamesense = {}
    do
        local gs = visuals.gamesense

        local indexing = {}
        local place = {
            active = {}
        }
        local colore = {}

        gs.index = function(ref)
            indexing[#indexing + 1] = ref
        end

        gs.handle = function()
            local updated_ind = {}
            local offset = 0
            local screen = vector(client.screen_size())

            for idx, name in pairs(indexing) do
                colore[name.text] = {r = name.r, g = name.g, b = name.b, a = name.a}
                if not place.active[name.text] then
                    place.active[name.text] = {r = 0, g = 0, b = 0, a = 0, alpha = 0, offset = 0, active = true}
                end
                updated_ind[name.text] = true
            end

            for name, value in pairs(place.active) do
                if updated_ind[name] then
                    value.alpha = math.lerp(value.alpha, 1, 0.1)
                    value.r = math.lerp(value.r, colore[name].r, 0.1)
                    value.g = math.lerp(value.g, colore[name].g, 0.1)
                    value.b = math.lerp(value.b, colore[name].b, 0.1)
                    value.a = math.lerp(value.a, colore[name].a, 0.1)
                    value.active = true
                else
                    value.alpha = math.lerp(value.alpha, 0, 0.1)
                    value.r = math.lerp(value.r, 255, 0.1)
                    value.g = math.lerp(value.g, 255, 0.1)
                    value.b = math.lerp(value.b, 255, 0.1)
                    value.a = math.lerp(value.a, 255, 0.1)
                    if value.alpha == 0 then
                        place.active[name] = nil
                    end
                end

                local size = render.measure_text("+d", name)
                local start = screen.y - 300
                offset = offset + (size.y + 12) * value.alpha
                local width_ind = math.floor(size.x / 2)
                local y = start - offset
                render.gradient(
                    vector(4, y),
                    vector(width_ind + 24, size.y + 4),
                    color(0, 0, 0, 0),
                    color(0, 0, 0, 50 * value.alpha),
                    true
                )
                render.gradient(
                    vector(28 + width_ind, y),
                    vector(29 + width_ind, size.y + 4),
                    color(0, 0, 0, 50 * value.alpha),
                    color(0, 0, 0, 0),
                    true
                )

                render.text(28, y + 2, color(value.r, value.g, value.b, value.a * value.alpha), "+d", 0, name)
            end
            indexing = {}
        end
    end

    visuals.scope = {}
    do
        local scope = visuals.scope

        scope.remove_lines = function()
            refs.other.remove_scope:override(true)
        end

        scope.handle = function()
            local scope_color = menu.elements["visuals"]["scope_accent_color"]
            local scope_inverted = menu.elements["visuals"]["scope_inverted"]
            local scope_size = menu.elements["visuals"]["scope_size"]
            local scope_gap = menu.elements["visuals"]["scope_gap"]

            refs.other.remove_scope:override(false)

            if not my.valid then
                return
            end

            local first_alpha = anim.new("scope::default", my.scoped and not scope_inverted and scope_color.a or 0)
            local second_alpha = anim.new("scope::inverted", my.scoped and scope_inverted and scope_color.a or 0)

            local clr = {
                scope_color:alpha_modulate(first_alpha),
                scope_color:alpha_modulate(second_alpha)
            }

            local position = vector(sc.x * 0.5, sc.y * 0.5)

            render.gradient(position - vector(0, scope_size + scope_gap), vector(1, scope_size), clr[2], clr[1])

            render.gradient(position + vector(0, scope_gap), vector(1, scope_size), clr[1], clr[2])

            render.gradient(position + vector(scope_gap, 0), vector(scope_size, 1), clr[1], clr[2], true)

            render.gradient(position - vector(scope_size + scope_gap, 0), vector(scope_size, 1), clr[2], clr[1], true)
        end

        menu.checkbox(groups.antiaim)("Custom Scope")("visuals", "scope", ts.is_other)
        menu.color_picker(groups.antiaim)("\nscope_color", color(255, 100))(
            "visuals",
            "scope_accent_color",
            function()
                return ts.is_other() and menu.elements["visuals"]["scope"]
            end
        )

        menu.checkbox(groups.antiaim)("  Inverted")(
            "visuals",
            "scope_inverted",
            function()
                return ts.is_other() and menu.elements["visuals"]["scope"]
            end
        )

        menu.slider(groups.antiaim)("  Size/Gap", 0, 300, 50, true, "px")(
            "visuals",
            "scope_size",
            function()
                return ts.is_other() and menu.elements["visuals"]["scope"]
            end
        )

        menu.slider(groups.antiaim)("\nscope_gap", 0, 300, 5, true, "px")(
            "visuals",
            "scope_gap",
            function()
                return ts.is_other() and menu.elements["visuals"]["scope"]
            end
        )

        menu.refs["visuals"]["scope"]:set_callback(
            function(self)
                events.paint_ui(scope.remove_lines, self:get())
                events.paint(scope.handle, self:get())
            end,
            true
        )
    end

    visuals.aspect_ratio = {}
    do
        local aspect_ratio = visuals.aspect_ratio

        aspect_ratio.update = function()
            local aspect_ratio_value =
                menu.elements["visuals"]["aspect_ratio"] and (menu.elements["visuals"]["aspect_ratio_value"] / 100) or 0

            cvar.r_aspectratio:set_raw_float(aspect_ratio_value)
        end

        aspect_ratio.reset = function()
            cvar.r_aspectratio:set_raw_float(0)
        end

        menu.checkbox(groups.antiaim)("Aspect Ratio")("visuals", "aspect_ratio", ts.is_other)

        menu.slider(groups.antiaim)(
            "\nratio",
            80,
            240,
            177,
            true,
            nil,
            0.01,
            {
                [125] = "5:4",
                [133] = "4:3",
                [150] = "3:2",
                [160] = "16:10",
                [177] = "16:9"
            }
        )(
            "visuals",
            "aspect_ratio_value",
            function()
                return ts.is_other() and menu.elements["visuals"]["aspect_ratio"]
            end
        )

        menu.refs["visuals"]["aspect_ratio"]:set_callback(
            function(self)
                aspect_ratio.update()

                menu.refs["visuals"]["aspect_ratio_value"]:set_callback(aspect_ratio.update, self:get())

                events.shutdown(aspect_ratio.reset, self:get())
            end,
            true
        )
    end

    visuals.viewmodel = {}
    do
        local viewmodel = visuals.viewmodel

        viewmodel.update = function()
            local viewmodel_fov =
                menu.elements["visuals"]["viewmodel"] and menu.elements["visuals"]["viewmodel_fov"] or 68
            local viewmodel_offset_x =
                menu.elements["visuals"]["viewmodel"] and menu.elements["visuals"]["viewmodel_x"] / 10 or 2.5
            local viewmodel_offset_y =
                menu.elements["visuals"]["viewmodel"] and menu.elements["visuals"]["viewmodel_y"] / 10 or 0
            local viewmodel_offset_z =
                menu.elements["visuals"]["viewmodel"] and menu.elements["visuals"]["viewmodel_z"] / 10 or -1.5

            cvar.viewmodel_fov:set_raw_float(viewmodel_fov)
            cvar.viewmodel_offset_x:set_raw_float(viewmodel_offset_x)
            cvar.viewmodel_offset_y:set_raw_float(viewmodel_offset_y)
            cvar.viewmodel_offset_z:set_raw_float(viewmodel_offset_z)
        end

        viewmodel.reset = function()
            cvar.viewmodel_fov:set_raw_float(68)
            cvar.viewmodel_offset_x:set_raw_float(2.5)
            cvar.viewmodel_offset_y:set_raw_float(0)
            cvar.viewmodel_offset_z:set_raw_float(-1.5)
        end

        menu.checkbox(groups.antiaim)("Viewmodel")("visuals", "viewmodel", ts.is_other)

        menu.slider(groups.antiaim)("\nviewmodel_fov", 0, 100, 68, true)(
            "visuals",
            "viewmodel_fov",
            function()
                return ts.is_other() and menu.elements["visuals"]["viewmodel"]
            end
        )

        menu.slider(groups.antiaim)("\nviewmodel_x", -100, 100, 25, true, nil, 0.1)(
            "visuals",
            "viewmodel_x",
            function()
                return ts.is_other() and menu.elements["visuals"]["viewmodel"]
            end
        )

        menu.slider(groups.antiaim)("\nviewmodel_y", -100, 100, 0, true, nil, 0.1)(
            "visuals",
            "viewmodel_y",
            function()
                return ts.is_other() and menu.elements["visuals"]["viewmodel"]
            end
        )

        menu.slider(groups.antiaim)("\nviewmodel_z", -100, 100, -15, true, nil, 0.1)(
            "visuals",
            "viewmodel_z",
            function()
                return ts.is_other() and menu.elements["visuals"]["viewmodel"]
            end
        )

        menu.refs["visuals"]["viewmodel"]:set_callback(
            function(self)
                viewmodel.update()

                menu.refs["visuals"]["viewmodel_fov"]:set_callback(viewmodel.update, self:get())
                menu.refs["visuals"]["viewmodel_x"]:set_callback(viewmodel.update, self:get())
                menu.refs["visuals"]["viewmodel_y"]:set_callback(viewmodel.update, self:get())
                menu.refs["visuals"]["viewmodel_z"]:set_callback(viewmodel.update, self:get())

                events.shutdown(viewmodel.reset, self:get())
            end,
            true
        )
    end

    visuals.sunset = {}
    do
        local sunset = visuals.sunset

        sunset.update = function()
            local sunset_x = menu.elements["visuals"]["sunset"] and menu.elements["visuals"]["sunset_x"] / 10 or 0
            local sunset_y = menu.elements["visuals"]["sunset"] and menu.elements["visuals"]["sunset_y"] / 10 or 0

            cvar.cl_csm_rot_override:set_int(1)
            cvar.cl_csm_rot_x:set_int(sunset_x)
            cvar.cl_csm_rot_y:set_int(sunset_y)
            cvar.cl_csm_max_shadow_dist:set_int(5000)
        end

        sunset.reset = function()
            cvar.cl_csm_rot_override:set_int(0)
        end

        menu.checkbox(groups.antiaim)("Sunset mode")("visuals", "sunset", ts.is_other)

        menu.slider(groups.antiaim)("X\nsunset", -360, 360, 0, true, "°")(
            "visuals",
            "sunset_x",
            function()
                return ts.is_other() and menu.elements["visuals"]["sunset"]
            end
        )

        menu.slider(groups.antiaim)("Y\nsunset", -360, 360, 0, true, "°")(
            "visuals",
            "sunset_y",
            function()
                return ts.is_other() and menu.elements["visuals"]["sunset"]
            end
        )

        menu.refs["visuals"]["sunset"]:set_callback(
            function(self)
                sunset.update()
                menu.refs["visuals"]["sunset_x"]:set_callback(sunset.update, self:get())
                menu.refs["visuals"]["sunset_y"]:set_callback(sunset.update, self:get())
                if not self:get() then
                    sunset.reset()
                end
                events.shutdown(sunset.reset, self:get())
            end,
            true
        )
    end

    visuals.animations = {}
    do
        local animations = visuals.animations

        animations.on_ground = {
            ["Static"] = function(ent)
                entity.set_prop(ent, "m_flPoseParameter", 1, 0)
                refs.antiaim.leg_movement:override("Always slide")
            end,
            ["Walking"] = function(ent)
                entity.set_prop(ent, "m_flPoseParameter", 0, 7)
                refs.antiaim.leg_movement:override("Never slide")
            end,
            ["Jitter"] = function(ent)
                entity.set_prop(ent, "m_flPoseParameter", 0, globals.tickcount() % 4 > 1 and 0.5 or 1)
                refs.antiaim.leg_movement:override(my.command_number % 3 == 0 and "Off" or "Always slide")
            end
        }

        animations.in_air = {
            ["Static"] = function(ent)
                entity.set_prop(ent, "m_flPoseParameter", 1, 6)
            end,
            ["Walking"] = function(ent)
                local animlayer = entity.get_animlayer(ent, 6)

                if animlayer == nil then
                    return
                end

                if my.state == my.states.air or my.state == my.states.air_crouch then
                    animlayer.m_flWeight = 1
                end
            end,
            ["Jitter"] = function(ent)
                entity.set_prop(ent, "m_flPoseParameter", client.random_float(0.0, 1.0), 5)
                entity.set_prop(ent, "m_flPoseParameter", client.random_float(0.0, 1.0), 6)
            end
        }

        animations.handle = function()
            if not my.valid then
                return
            end

            local animstate = entity.get_animstate(my.entity)

            if animstate == nil then
                return
            end

            local on_ground = animations.on_ground[menu.elements["visuals"]["animations_on_ground"]]
            local in_air = animations.in_air[menu.elements["visuals"]["animations_in_air"]]

            if on_ground then
                on_ground(my.entity)
            end

            if in_air then
                in_air(my.entity)
            end

            if menu.elements["visuals"]["animations_pitch_on_land"] then
                if animstate.hit_in_ground_animation and not my.jumping then
                    entity.set_prop(my.entity, "m_flPoseParameter", 0.5, 12)
                end
            end

            if menu.elements["visuals"]["animations_sliding_slowwalk"] then
                entity.set_prop(my.entity, "m_flPoseParameter", 0, 9)
            end

            if menu.elements["visuals"]["animations_sliding_crouch"] then
                entity.set_prop(my.entity, "m_flPoseParameter", 0, 8)
            end

            if menu.elements["visuals"]["animations_earthquake"] then
                entity.get_animlayer(my.entity, 12).m_flWeight = client.random_float(0.0, 1.0)
            elseif menu.elements["visuals"]["animations_move_lean"] > 0 and my.velocity > 2 then
                entity.get_animlayer(my.entity, 12).m_flWeight = menu.elements["visuals"]["animations_move_lean"] * 0.01
            end
        end

        menu.checkbox(groups.fakelag)("Anim. Breaker")("visuals", "animations", ts.is_other)
        menu.checkbox(groups.fakelag)("Pitch 0 on Land")(
            "visuals",
            "animations_pitch_on_land",
            function()
                return ts.is_other() and menu.elements["visuals"]["animations"]
            end
        )
        menu.checkbox(groups.fakelag)("Earthquake")(
            "visuals",
            "animations_earthquake",
            function()
                return ts.is_other() and menu.elements["visuals"]["animations"]
            end
        )
        menu.combobox(groups.fakelag)("On Ground", {"Disabled", "Static", "Walking", "Jitter"})(
            "visuals",
            "animations_on_ground",
            function()
                return ts.is_other() and menu.elements["visuals"]["animations"]
            end
        )
        menu.combobox(groups.fakelag)("In Air", {"Disabled", "Static", "Walking", "Jitter"})(
            "visuals",
            "animations_in_air",
            function()
                return ts.is_other() and menu.elements["visuals"]["animations"]
            end
        )
        menu.slider(groups.fakelag)("Move Lean", 0, 100, 100, true, "%", 1, {[0] = "Default"})(
            "visuals",
            "animations_move_lean",
            function()
                return ts.is_other() and menu.elements["visuals"]["animations"]
            end
        )

        menu.refs["visuals"]["animations"]:set_callback(
            function(self)
                events.pre_render(animations.handle, self:get())
            end,
            true
        )
    end
end

-- #region : Update pui.setup
configs.data = pui.setup({antiaim = menu.refs["antiaim"], visuals = menu.refs["visuals"]}, true)
-- #endregion

-- #region : Update Database
events.shutdown:set(
    function()
        database.write(db.name, db.data)
    end
)
-- #endregion
