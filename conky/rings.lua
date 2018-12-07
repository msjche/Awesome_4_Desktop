--[[
Ring Meters by londonali1010 (2009)

This script draws percentage meters as rings. It is fully customisable; all options are described in the script.

IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement near the end of the script uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num > 5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num > 3; conversely if you update Conky every 0.5s, you should use update_num > 10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.

To call this script in Conky, use the following (assuming that you save this script to ~/scripts/rings.lua):
	lua_load ~/scripts/rings-v1.2.1.lua
	lua_draw_hook_pre ring_stats
	
Changelog:
+ v1.2.1 -- Fixed minor bug that caused script to crash if conky_parse() returns a nil value (20.10.2009)
+ v1.2 -- Added option for the ending angle of the rings (07.10.2009)
+ v1.1 -- Added options for the starting angle of the rings, and added the "max" variable, to allow for variables that output a numerical value rather than a percentage (29.09.2009)
+ v1.0 -- Original release (28.09.2009)
]]

settings_table = {
    
	{
        name='acpitemp',
        arg='',
        max=110,
        bg_colour=0xE1E4E7,
        bg_alpha=0,
        fg_colour=0xff3300,
        fg_alpha=1,
        x=250, y=196,
        radius=183,
        thickness=6,
        start_angle=0,
        end_angle=270
    },    
{
        name='cpu',
        arg='cpu1',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.3,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=171,
        thickness=10,
        start_angle=0,
        end_angle=270
    },{
        name='cpu',
        arg='cpu2',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.25,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=160,
        thickness=10,
        start_angle=0,
        end_angle=270
    },{
        name='cpu',
        arg='cpu3',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.2,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=149,
        thickness=10,
        start_angle=0,
        end_angle=270
    },{
        name='cpu',
        arg='cpu4',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.15,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=138,
        thickness=10,
        start_angle=0,
        end_angle=270
    },{
        name='cpu',
        arg='cpu5',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.1,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=127,
        thickness=10,
        start_angle=0,
        end_angle=270
    },
    {
        name='cpu',
        arg='cpu6',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.1,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=116,
        thickness=10,
        start_angle=0,
        end_angle=270
    },    
    {
        name='cpu',
        arg='cpu7',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.1,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=105,
        thickness=10,
        start_angle=0,
        end_angle=270
    },    
    {
        name='cpu',
        arg='cpu8',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.15,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=94,
        thickness=10,
        start_angle=0,
        end_angle=270
    },
    {
        name='cpu',
        arg='cpu9',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.2,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=83,
        thickness=10,
        start_angle=0,
        end_angle=270
    },
    {
        name='cpu',
        arg='cpu10',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.25,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=72,
        thickness=10,
        start_angle=0,
        end_angle=270
    },
{
        name='cpu',
        arg='cpu11',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.3,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=61,
        thickness=10,
        start_angle=0,
        end_angle=270
    },
    {
        name='cpu',
        arg='cpu12',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.35,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=250, y=196,
        radius=50,
        thickness=10,
        start_angle=0,
        end_angle=270
    },
    {
        name='memperc',
        arg='',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.3,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=100, y=446,
        radius=70,
        thickness=20,
        start_angle=180,
        end_angle=420
    },
    {
        name='swapperc',
        arg='',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.1,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=100, y=446,
        radius=54,
        thickness=10,
        start_angle=180,
        end_angle=420
    },
    {
        name='fs_used_perc',
        arg='/media/Data',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.5,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=340, y=637,
        radius=90,
        thickness=14,
        start_angle=290,
        end_angle=540
    },
    {
        name='fs_used_perc',
        arg='/home',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.4,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=340, y=637,
        radius=75,
        thickness=14,
        start_angle=290,
        end_angle=540
    },
    {
        name='fs_used_perc',
        arg='/',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.3,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=340, y=637,
        radius=60,
        thickness=14,
        start_angle=290,
        end_angle=540
    },
    {
        name='fs_used_perc',
        arg='/boot',
        max=100,
        bg_colour=0xE1E4E7,
        bg_alpha=0.2,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=340, y=637,
        radius=45,
        thickness=14,
        start_angle=290,
        end_angle=540
    },
    {
        name='downspeedf',
        arg='eno1',
        max=10000,
        bg_colour=0xE1E4E7,
        bg_alpha=0.5,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=100, y=910,
        radius=80,
        thickness=24,
        start_angle=180,
        end_angle=420
    },
    {
        name='upspeedf',
        arg='eno1',
        max=1500,
        bg_colour=0xE1E4E7,
        bg_alpha=0.3,
        fg_colour=0x1793D0,
        fg_alpha=1,
        x=100, y=910,
        radius=55,
        thickness=24,
        start_angle=180,
        end_angle=420
    },
--    {
--        name='time',
--        arg='%S',
--        max=60,
--        bg_colour=0xE1E4E7,
--        bg_alpha=0.8,
--        fg_colour=0x1793D0,
--        fg_alpha=1,
--        x=230, y=410,
--        radius=30,
--        thickness=12,
--        start_angle=0,
--        end_angle=230
--    },
--    {
--        name='time',
--        arg='%M',
--        max=60,
--        bg_colour=0xE1E4E7,
--        bg_alpha=0.6,
--        fg_colour=0x1793D0,
--        fg_alpha=1,
--        x=230, y=410,
--        radius=18,
--        thickness=8,
--        start_angle=0,
--        end_angle=230
--    },
--    {
--        name='time',
--        arg='%H',
--        max=24,
--        bg_colour=0xE1E4E7,
--        bg_alpha=0.4,
--        fg_colour=0x1793D0,
--        fg_alpha=1,
--        x=230, y=410,
--        radius=10,
--        thickness=4,
--        start_angle=0,
--        end_angle=230
--    },
}

require 'cairo'

function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,t,pt)

	local w,h=conky_window.width,conky_window.height
	
	local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
	local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

	local angle_0=sa*(2*math.pi/360)-math.pi/2
	local angle_f=ea*(2*math.pi/360)-math.pi/2
	local t_arc=t*(angle_f-angle_0)

	-- Draw background ring

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
	cairo_set_line_width(cr,ring_w)
	cairo_stroke(cr)
	
	-- Draw indicator ring

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
	cairo_stroke(cr)		
end

function conky_ring_stats()
	local function setup_rings(cr,pt)
		local str=''
		local value=0
		
		str=string.format('${%s %s}',pt['name'],pt['arg'])
		str=conky_parse(str)
		
		value=tonumber(str)
		if value == nil then value = 0 end
		pct=value/pt['max']
		
		draw_ring(cr,pct,pt)
	end

	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
	
	local cr=cairo_create(cs)	
	
	local updates=conky_parse('${updates}')
	update_num=tonumber(updates)

	if update_num>5 then
	    for i in pairs(settings_table) do
		setup_rings(cr,settings_table[i])
	    end
	end
   cairo_surface_destroy(cs)
  cairo_destroy(cr)
end