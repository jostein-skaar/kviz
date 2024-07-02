// clang-format off
include<../../3d-parts-library/src/box.scad>;
include<../../3d-parts-library/src/microbit.scad>;
include<../../3d-parts-library/src/el-parts.scad>;
include<../../3d-parts-library/src/jst.scad>;
// clang-format on

show_battery_pack = $preview ? false : false;

wall = 2.4;

controller_x = 64;
controller_y = 105;
controller_z = 21;

part = "remote";
if (part == "remote")
{
  remote();
}
else if (part == "remote_lid")
{
  box_sliding_lid(controller_x, controller_y, controller_z, wall, $slop = 0.15);
}
else if (part == "microbit_connector_fastener")
{
  microbit_connector_fastener();
}
else if (part == "button_fastener")
{
  button_fastener($slop = 0.1);
}
else if (part == "box_simple_lock_fastener")
{
  box_simple_lock_fastener($slop = 0.1);
}
else if (part == "jst_male")
{
  jst_male(n = 5, $slop = 0.1);
}
else if (part == "jst_female")
{
  jst_female(n = 5, $slop = 0.1);
}
else if (part == "button_cap_a")
{
  button_cap("../../kviz/3d-models/kviz-button-a.svg", size = [ 16, 14.44 ], offset = [ 0, 0.2 ]);
}
else if (part == "button_cap_b")
{
  button_cap("../../kviz/3d-models/kviz-button-b.svg", size = [ 16, 14.44 ], offset = [ 0, 0 ]);
}
else if (part == "button_cap_c")
{
  button_cap("../../kviz/3d-models/kviz-button-c.svg", size = [ 13.67, 13.67 ], offset = [ 0, 0 ]);
}
else if (part == "button_cap_d")
{
  button_cap("../../kviz/3d-models/kviz-button-d.svg", size = [ 14.44, 14.44 ], offset = [ 0, 0 ]);
}
else if (part == "microbit_soldering_guide")
{
  microbit_soldering_guide(text = "kviz", pins_to_show = [ 1, 23, 24, 25, 26, 35 ],
                           pin_text = " G             23.......1   ", $fn = 64);
}

module remote()
{
  diff() box_sliding(controller_x, controller_y, controller_z, wall, inner_walls = [73.3], anchor = BOT)
  {
    // Holes for the microbit battery wire
    tag("remove") left(wall) fwd(wall) position(BOT + BACK + RIGHT)
      microbit_battery_pack_wire_hole(wall, anchor = BOT + BACK + RIGHT);

    // Show the microbit battery pack
    if (show_battery_pack)
    {
      up(wall) fwd(wall) position(BOT + BACK) color("grey") microbit_battery_pack(anchor = BOT + BACK);
    }

    position(BOT + FWD)
    {
      // Buttons
      back(8)
      {
        tag("remove") button_grid_hole(wall, n = [ 2, 2 ], anchor = BOT + FWD);
        tag("keep") button_grid(n = [ 2, 2 ], anchor = BOT + FWD);
      }

      // Microbit connector
      back(54.4)
      {
        tag("remove") microbit_connector_hole(wall, anchor = BOT + FWD);

        tag("keep") microbit_connector(pins_to_show = [ 1, 23, 24, 25, 26, 35 ], pin_text = " G         23...1   ",
                                       anchor = BOT + FWD);
      }
    }

    // // Odek
    // up(wall) fwd(11) position(BOT + BACK)
    // {
    //   resize([ 30, 0, 0.2 ], auto = true) linear_extrude(height = 1) import("odek-logo.svg", center = true);
    //   fwd(10)
    //     text3d("kviz.it  odek.no", h = 0.2, size = 4.5, font = "Arial", orient = UP, anchor = BOT + FWD, center =
    //     true);
    // }

    up(wall) back(wall + 0.5) position(BOT + FWD)
    {
      text3d("v1", h = 0.2, size = 4, font = "Arial", orient = UP, anchor = BOT + FWD, center = true);
    }
  }
}
