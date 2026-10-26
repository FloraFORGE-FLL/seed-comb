// ===============================================================
// Native Seed Harvesting Comb, round handle + twist-lock heads
// One handle, two interchangeable comb heads (coarse and fine).
// Push a head into the handle and twist it 45° until it clicks.
// ===============================================================
//
// Key dimensions (defaults):
//   Handle: Ø27 mm grip, 145 mm long, Ø30 mm pommel
//   Heads:  152 mm wide, 26 mm bar + 22 mm teeth, 11 mm thick
//   Coarse: 8.0 mm tooth pitch    Fine: 4.5 mm tooth pitch
//
// Features:
//   - Turned, cigar-shaped handle with a flared pommel and 8
//     shallow twisted flutes that fade out toward each end
//   - Bayonet twist lock: two lugs on the head's spigot drop into
//     entry slots, then turn 45° under a ledge so the head can't
//     pull out
//   - Click detent: the spigot is split so its halves flex inward
//     as the lugs ride over a small bump; the head snaps into the
//     locked position and won't rotate loose while combing
//   - Hard end stop at the locked angle
//   - Engraved "insert" dot -> arc -> "locked" dot on the handle;
//     the dots on top of each head line up with them
//   - Head ID dots: 2 dots = coarse, 3 dots = fine
//   - Wedge-shaped comb bar, rounded everywhere, tapered teeth
//     with rounded tips
//   - Teardrop lanyard hole through the pommel
//   - Clip-on seed tray: a shallow tub that snaps over the bar's
//     back edge and sits under the flat face, reaching just under
//     the tooth roots. Seeds that drop through the root gaps land
//     in it. Fits either head.
//
// Printing:
//   - Handle: stand upright on the pommel, socket up. No supports.
//     145 mm tall. The lock-groove ceilings are 2 mm overhangs,
//     which print fine without support.
//   - Heads: lay flat, teeth on the bed. No supports (lug flanks
//     are 45°). 11 mm tall.
//   - Tray: stand it on its flat back face (clips down, open front
//     up). No supports. ~36 mm tall.
//   - If the click is too stiff/loose, adjust detent_depth.
//     If the head is tight in the socket, raise fit_clear.
// ===============================================================

/* [Part] */
part = "assembled"; // ["assembled", "section", "print", "handle", "coarse", "fine", "tray"]
show_head = "coarse"; // ["coarse", "fine"]
locked = true;        // Show the head twisted into the locked position
show_tray = true;     // Show the seed tray clipped under the head

/* [Handle] */
handle_length = 145;  // Overall handle length, pommel to socket rim (mm)
pommel_d      = 30;   // Diameter of the pommel bulb (mm)
waist_d       = 23;   // Diameter just above the pommel (mm)
grip_d        = 27;   // Diameter at the fattest part of the grip (mm)
neck_d        = 24;   // Diameter where the grip narrows near the top (mm)
ferrule_d     = 26;   // Diameter of the socket end (mm)
edge_r        = 1.2;  // Rounding on the handle's end edges (mm)
flute_count   = 8;    // Number of grip flutes
flute_depth   = 0.9;  // Flute depth at the fattest part of the grip (mm)
flute_r       = 3;    // Radius of the flute cutter (mm)
flute_twist   = 60;   // How far the flutes spiral along the grip (degrees)
lanyard_d     = 5;    // Lanyard hole diameter (mm)

/* [Comb Heads] */
head_width      = 152; // Bar width, ~6 inches (mm)
head_height     = 26;  // Bar depth, back edge to tooth roots (mm)
head_depth      = 11;  // Bar thickness at the back edge (mm)
tooth_length    = 22;  // Tooth length beyond the bar (mm)
coarse_pitch    = 8.0; // Tooth spacing, coarse head (mm)
fine_pitch      = 4.5; // Tooth spacing, fine head (mm)
tooth_width     = 2.8; // Tooth width at the root (mm)
tooth_thickness = 4.0; // Tooth thickness at the root (mm)
tip_width       = 1.6; // Tooth width at the tip (mm)
tip_thickness   = 2.6; // Tooth thickness at the tip (mm)
end_margin      = 8;   // Space from bar end to the outermost tooth (mm)

/* [Twist Lock] */
spigot_d     = 14;   // Spigot diameter (mm)
spigot_len   = 20;   // Spigot length below the shoulder (mm)
collar_len   = 6;    // Collar between the bar and the handle rim (mm)
lug_offset   = 9;    // Shoulder to the top face of each lug (mm)
lug_len      = 5;    // Lug length along the spigot (mm)
lug_height   = 2;    // How far each lug stands out from the spigot (mm)
lug_width    = 3;    // Width of the lug's outer face (mm)
lock_angle   = 45;   // Twist from insert to locked (degrees)
detent_depth = 0.6;  // How far the click bump sticks into the groove (mm)
bump_r       = 1.2;  // Radius of the click bump (mm)
split_w      = 1.6;  // Width of the slot that lets the spigot flex (mm)
fit_clear    = 0.25; // Radial clearance per side in the socket (mm)
axial_clear  = 0.15; // Play between lug and groove ceiling (mm)

/* [Seed Tray] */
tray_width  = 164;  // Tray width; wider than the bar so it catches what falls off the ends (mm)
tray_depth  = 16;   // How far the tray hangs below the bar's flat face (mm)
tray_reach  = 12;   // How far the tray runs under the teeth; 0 keeps teeth fully clear (mm)
clip_x      = 45;   // Distance from center to each snap clip (mm)
tray_wall   = 2;    // Tray and clip wall thickness (mm)
lip_height  = 6;    // Height of the front lip that keeps seeds in (mm)
clip_width  = 12;   // Width of each snap clip (mm)
clip_reach  = 6;    // How far each clip hooks over the top of the bar (mm)
clip_clear  = 0.2;  // Gap between clip and bar; lower for a tighter snap (mm)

$fn = 96;

// --- DERIVED ---
L  = handle_length;
D  = head_depth;
H  = head_height;
W  = head_width;
T  = tooth_thickness;

spigot_r  = spigot_d / 2;
lug_r     = spigot_r + lug_height;
groove_r  = lug_r + fit_clear;
bore_r    = spigot_r + fit_clear;
bore_depth = spigot_len + 1;
groove_top = lug_offset - axial_clear;           // depth below the rim
groove_bot = lug_offset + lug_len + fit_clear;   // depth below the rim

// Click bump sits just behind where the lug stops
lug_ang   = atan2(lug_width / 2 + detent_depth, lug_r);
bump_cr   = groove_r + bump_r - detent_depth;
bump_half = asin(bump_r / bump_cr);
bump_ang  = lock_angle - lug_ang - bump_half - 1;
assert(bump_ang - bump_half > lug_ang + 1, "lock_angle too small for the detent bump");
assert(lug_width / 2 + lug_height + 0.6 < D / 2, "lugs too wide for head_depth");

// Handle profile knots: [z, radius], blended with cosine easing
K = [
    [0,          pommel_d / 2 - 2.5],
    [7,          pommel_d / 2],
    [24,         waist_d / 2],
    [0.56 * L,   grip_d / 2],
    [L - 17,     neck_d / 2],
    [L - 5,      ferrule_d / 2],
    [L,          ferrule_d / 2]
];
lanyard_z = 8;
flute_z0  = 26;
flute_len = L - 22 - flute_z0;
flute_cr  = grip_d / 2 + flute_r - flute_depth;
mark_z    = L - 2.6;

// Comb bar corner radii and the bar's top-surface slope
bar_rt   = 4;    // back (thick) edge radius
bar_ft   = 1.5;  // front (thin) edge radius
boss_len = 8;    // how far the hub blend runs into the bar
boss_w   = ferrule_d + 16;
function bar_top(y) = D - (D - T) * (y - bar_rt) / (H - bar_ft - bar_rt);

// Seed tray, in head coordinates (bar's flat face at z = 0)
tray_back  = -clip_clear - tray_wall;  // outer back face, also the print bed
tray_front = H + tray_reach;
tray_top   = -clip_clear;
tray_r     = 6;                        // plan corner radius
tray_rb    = 3;                        // floor edge radius
assert(clip_x + clip_width / 2 < W / 2 - bar_rt, "clips must sit on the straight part of the bar");

// --- HANDLE ---

function seg(z, i = 0) = (i >= len(K) - 2 || z <= K[i + 1][0]) ? i : seg(z, i + 1);
function prof_r(z) =
    let(i = seg(z), a = K[i], b = K[i + 1], t = (z - a[0]) / (b[0] - a[0]))
    a[1] + (b[1] - a[1]) * (1 - cos(180 * t)) / 2;

// Half cross-section of the handle, ends rounded
module handle_profile() {
    intersection() {
        offset(r = edge_r) offset(delta = -edge_r)
            polygon(concat([[-5, 0]], [for (z = [0 : 1 : L]) [prof_r(z), z]], [[-5, L]]));
        square([pommel_d, L]);
    }
}

// Shallow spiral flutes; they fade out where the grip narrows
module flutes() {
    translate([0, 0, flute_z0])
        linear_extrude(height = flute_len, twist = flute_twist, slices = 40, convexity = 4)
            for (i = [0 : flute_count - 1])
                rotate(i * 360 / flute_count)
                    translate([flute_cr, 0]) circle(r = flute_r, $fn = 32);
}

// 2D teardrop, point toward -X, so it prints overhang-free once rotated
module teardrop(r) {
    hull() {
        circle(r = r, $fn = 32);
        translate([-r * sqrt(2), 0]) square(0.01, center = true);
    }
}

// Horizontal lanyard hole through the pommel
module lanyard() {
    translate([0, 0, lanyard_z]) rotate([0, 90, 0])
        linear_extrude(height = pommel_d + 2, center = true) teardrop(lanyard_d / 2);
}

// One lug's 2D footprint (+X side), 45° flanks, rounded outer face
module lug_single2d() {
    intersection() {
        circle(r = lug_r);
        polygon([
            [spigot_r - 0.6, -(lug_width / 2 + lug_height + 0.6)],
            [lug_r + 1,      -(lug_width / 2 - 1)],
            [lug_r + 1,        lug_width / 2 - 1],
            [spigot_r - 0.6,   lug_width / 2 + lug_height + 0.6]
        ]);
    }
}

// Both lugs
module lug2d() {
    for (s = [0, 180]) rotate(s) lug_single2d();
}

// Path the lugs sweep while twisting, minus the click bumps
module groove2d() {
    step = 3;
    difference() {
        for (s = [0, 180], a = [0 : step : lock_angle - step])
            hull() {
                rotate(s + a)        offset(delta = fit_clear) lug_single2d();
                rotate(s + a + step) offset(delta = fit_clear) lug_single2d();
            }
        for (s = [0, 180])
            rotate(s + bump_ang) translate([bump_cr, 0]) circle(r = bump_r, $fn = 32);
    }
}

// Bore, entry slots and twist-lock groove at the top of the handle
module socket() {
    translate([0, 0, L - bore_depth]) cylinder(r = bore_r, h = bore_depth + 1);
    translate([0, 0, L - groove_bot])
        linear_extrude(groove_bot + 1) offset(delta = fit_clear) lug2d();
    translate([0, 0, L - groove_bot])
        linear_extrude(groove_bot - groove_top) groove2d();
    // Lead-in chamfer
    translate([0, 0, L - 1]) cylinder(r1 = bore_r, r2 = bore_r + 1.01, h = 1.01);
}

// Engraved insert dot, arc and locked dot (both sides)
module marks() {
    mr = ferrule_d / 2;
    for (s = [90, 270]) rotate(s) {
        translate([mr, 0, mark_z]) sphere(d = 1.8, $fn = 24);
        rotate_extrude(angle = lock_angle, $fn = 96)
            translate([mr, mark_z]) circle(d = 1.0, $fn = 16);
        rotate(lock_angle) translate([mr, 0, mark_z]) sphere(d = 2.6, $fn = 24);
    }
}

// Complete handle, standing on its pommel
module handle() {
    difference() {
        rotate_extrude() handle_profile();
        flutes();
        lanyard();
        socket();
        marks();
    }
}

// --- COMB HEADS ---

// Spigot/collar cross-section: circle trimmed flat to the head thickness
module dd2d(d) {
    offset(r = 0.8) offset(delta = -0.8)
        intersection() {
            circle(d = d);
            square([d + 2, D], center = true);
        }
}

// Collar, split spigot and lugs; shoulder at z = 0, spigot toward -Z
module spigot() {
    chamf = 0.8;
    hull() {
        translate([0, 0, chamf]) linear_extrude(collar_len - chamf) dd2d(ferrule_d);
        linear_extrude(chamf) dd2d(ferrule_d - 2 * chamf);
    }
    difference() {
        union() {
            hull() {
                translate([0, 0, -spigot_len + 1]) linear_extrude(spigot_len - 1 + 0.01) dd2d(spigot_d);
                translate([0, 0, -spigot_len]) linear_extrude(1) dd2d(spigot_d - 2);
            }
            translate([0, 0, -lug_offset - lug_len]) linear_extrude(lug_len) lug2d();
        }
        // Split lets the two halves flex inward over the click bumps
        translate([-split_w / 2, -D, -spigot_len - 1]) cube([split_w, 2 * D, spigot_len + 1]);
        rotate([90, 0, 0]) cylinder(d = split_w, h = 2 * D, center = true, $fn = 24);
    }
}

// Rounded vertical post with a domed top, flat on the bed
module pill(r, h) {
    cylinder(r = r, h = h - r);
    translate([0, 0, h - r]) sphere(r = r);
}

// Wedge-shaped bar: thick at the back, thin where the teeth start
module bar() {
    hull() for (s = [-1, 1]) {
        translate([s * (W / 2 - bar_rt), bar_rt, 0]) pill(bar_rt, D, $fn = 48);
        translate([s * (W / 2 - 5), H - bar_ft, 0]) pill(bar_ft, T, $fn = 32);
    }
}

// One tapered tooth with a rounded tip
module tooth(x) {
    rr = min(1.2, tooth_width / 2);
    hull() {
        for (s = [-1, 1])
            translate([x + s * (tooth_width / 2 - rr), H - 3, 0]) pill(rr, T, $fn = 24);
        translate([x, H + tooth_length - tip_width / 2, 0]) pill(tip_width / 2, tip_thickness, $fn = 24);
    }
}

// Smooth blend from the round collar into the sloped bar
module hub() {
    hull() {
        translate([0, -0.01, D / 2]) rotate([-90, 0, 0])
            linear_extrude(0.01) dd2d(ferrule_d);
        translate([0, boss_len, 0]) rotate([90, 0, 0])
            linear_extrude(0.01)
                translate([-boss_w / 2, 0])
                    offset(r = 2) offset(delta = -2) square([boss_w, bar_top(boss_len) - 0.2]);
    }
}

// Full comb head lying flat; bar back edge at y = 0, teeth toward +Y
module comb_head(pitch, dots) {
    n = floor((W - 2 * end_margin) / pitch) + 1;
    difference() {
        union() {
            bar();
            hub();
            for (i = [0 : n - 1]) tooth((i - (n - 1) / 2) * pitch);
            translate([0, -collar_len, D / 2]) rotate([-90, 0, 0]) spigot();
        }
        // ID dots on top of the collar; also the alignment mark
        for (i = [0 : dots - 1])
            translate([(i - (dots - 1) / 2) * 4, -collar_len / 2, D + 0.6]) sphere(d = 3, $fn = 24);
    }
}

module coarse_head() comb_head(coarse_pitch, 2);
module fine_head()   comb_head(fine_pitch, 3);

// --- SEED TRAY ---

// Bar cross-section in the YZ plane (2D x = head y, 2D y = head z)
module bar_profile2d() {
    hull() {
        translate([bar_rt, D - bar_rt]) circle(bar_rt);
        square([2 * bar_rt, D - bar_rt]);
        translate([H - bar_ft, T - bar_ft]) circle(bar_ft);
        translate([H - 2 * bar_ft, 0]) square([2 * bar_ft, T - bar_ft]);
    }
}

// Upright disc with a rounded bottom edge
module puck(rp, rb, h) {
    rotate_extrude($fn = 48) hull() {
        translate([rp - rb, rb]) circle(rb, $fn = 32);
        square([0.01, h]);
        translate([0, h - 0.01]) square([rp, 0.01]);
    }
}

// Rounded tub: soft plan corners and floor edges, flat top
module tub(x0, x1, y0, y1, z0, h, rp, rb) {
    hull() for (x = [x0 + rp, x1 - rp], y = [y0 + rp, y1 - rp])
        translate([x, y, z0]) puck(rp, rb, h);
}

// C-clip profile that hugs the bar's back edge and hooks over the top
module clip_profile2d() {
    intersection() {
        difference() {
            offset(r = clip_clear + tray_wall) bar_profile2d();
            offset(delta = clip_clear) bar_profile2d();
        }
        translate([tray_back - 1, tray_top - 1]) square([clip_reach - tray_back + 1, D + 10]);
    }
}

// Tray that snaps onto the bar and catches seeds under the tooth roots
module seed_tray() {
    w = tray_width;
    difference() {
        tub(-w / 2, w / 2, tray_back, tray_front, -tray_depth, tray_depth + tray_top,
            tray_r, tray_rb);
        intersection() {
            tub(-w / 2 + tray_wall, w / 2 - tray_wall, tray_top, tray_front - tray_wall,
                -tray_depth + tray_wall, tray_depth + 5, tray_r - tray_wall, tray_rb - tray_wall);
            // 45° inside face on the front lip so it prints without support
            translate([0, tray_front - tray_wall, -tray_depth + lip_height])
                rotate([-45, 0, 0]) translate([-w, -2 * w, -w]) cube([2 * w, 2 * w, 2 * w]);
        }
        // Open the front above the lip
        translate([0, tray_front - tray_wall - 0.01, 0]) rotate([-90, 0, 0])
            linear_extrude(tray_wall + 1)
                offset(r = 3) offset(delta = -3)
                    translate([-(w / 2 - tray_wall), -5])
                        square([w - 2 * tray_wall, tray_depth - lip_height + 5]);
    }
    for (s = [-1, 1])
        translate([s * clip_x, 0, 0]) rotate([90, 0, 90])
            linear_extrude(clip_width, center = true) clip_profile2d();
}

// --- LAYOUTS ---

// Head on the handle, inserted or locked
module assembled() {
    handle();
    translate([0, 0, L]) rotate([0, 0, locked ? lock_angle : 0])
        rotate([90, 0, 0]) translate([0, collar_len, -D / 2]) {
            if (show_head == "fine") fine_head(); else coarse_head();
            if (show_tray) seed_tray();
        }
}

// Tray standing on its back face, as printed
module tray_print() {
    translate([0, 0, -tray_back]) rotate([90, 0, 0]) seed_tray();
}

// Assembly cut through the lugs to check the lock
module section() {
    difference() {
        assembled();
        rotate([0, 0, locked ? lock_angle : 0])
            translate([-200, -400, -10]) cube([400, 400, L + 200]);
    }
}

// All three parts on one plate in print orientation
module print_plate() {
    translate([-50, 14, 0]) handle();
    translate([0, -22, 0]) tray_print();
    translate([0, 30, 0]) coarse_head();
    translate([0, 110, 0]) fine_head();
}

if      (part == "handle")  handle();
else if (part == "tray")    tray_print();
else if (part == "coarse")  coarse_head();
else if (part == "fine")    fine_head();
else if (part == "print")   print_plate();
else if (part == "section") section();
else                        assembled();
