How to use 2D drivers
=====================

Here are demos using 2D drivers:

* https://www.youtube.com/watch?v=suswjbpR1HU
* https://www.youtube.com/watch?v=JFmCin3EJIs

The first video is a scaling test (source coming soon), 
and the second video is a demo of moving a lot of sprites 
around at once.

* https://github.com/librerpi/lk-overlay/blob/master/app/grid/grid.c

In this file, `gfx_create_surface()` will create a bitmap image in ram.

Lines 18-29:

	  for (int x=0; x< width; x++) {
	    for (int y=0; y < height; y++) {
		  uint color = 0x00000000;
		  if (true) {
		    if (y % grid == 0) color |= 0xffff0000;
		    if (y % grid == 1) color |= 0xffff0000;
		    if (x % grid == 0) color |= 0xff0000ff;
		    if (x % grid == 1) color |= 0xff0000ff;
		  }
		  gfx_putpixel(gfx_grid, x, y, color);
	    }
	  }

Those lines will render a grid into it (there's also the 
ability to load tga image files).

Lines 31-35:

	  grid_layer = malloc(sizeof(hvs_layer));
	  mk_unity_layer(grid_layer, gfx_grid, 60, 100, 100);
	  grid_layer->name = "grid";
	  grid_layer->w = 100;
	  grid_layer->h = 300;

Those lines will create a sprite description.

Lines 37-40:

	  mutex_acquire(&channels[channel].lock);
	  hvs_dlist_add(channel, grid_layer);
	  hvs_update_dlist(channel);
	  mutex_release(&channels[channel].lock);
	}

Those lines will make that sprite visible, and 
will schedule a pageflip on the next vsync.

Line 53:

	    hvs_wait_vsync(channel);

will wait for vsync to happen.

Lines 55-72:

		{
		  if (grow_w && (grid_layer->w >= 300)) grow_w = false;
		  if (!grow_w && (grid_layer->w <= 5)) grow_w = true;

		  int delta = 1;
		  if (!grow_w) delta = -1;

		  grid_layer->w += delta;
		}
		{
		  if (grow_h && (grid_layer->h >= 300)) grow_h = false;
		  if (!grow_h && (grid_layer->h <= 5)) grow_h = true;

		  int delta = 1;
		  if (!grow_h) delta = -1;

		  grid_layer->h += delta;
		}

These lines change the sprite size.

And finally, line 75:

	    hvs_update_dlist(channel);

This line schedules another pageflip on vsync.

With all that code, and some GPIO reading, you 
can make a 2D demo or game, and this basically 
uses 0% of the cpu, instead, it uses the gpu, 
and has absolutely no screen tearing.


