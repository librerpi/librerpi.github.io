<img src="img/banner.jpg" style="float: right; width: 600px">

Welcome to librerpi!
====================

librerpi is a FOSS boot firmware based on littlekernel for Raspberry Pi 
boards, it replaces the proprietary boot firmware normally used to boot.

Website still incomplete
------------------------

This website is still very much incomplete, so contributions to it are very 
much welcome. We especially need more documentation about how RPi boards work 
as well as moving notes in the main lk-overlay repo to the website.

If you see dead links or any other issue, feel free to report them too.

Videos showing librerpi
-----------------------

- [2D and 3D demo](https://www.youtube.com/watch?v=GHDh9RYg6WI)
- [librerpi booting NixOS with a 2D/3D demo](https://www.youtube.com/watch?v=BQyyVtmmVg8)
- [13 sprites bouncing around](https://www.youtube.com/watch?v=JFmCin3EJIs)
- [HVS scaling animation](https://www.youtube.com/watch?v=suswjbpR1HU)
* [Screensaving simulator with image loading](https://www.youtube.com/watch?v=ceRDMuPWyt0)
* [Multiple RaspberryPi logos bouncing around](https://www.youtube.com/watch?v=XBdUVmar7Rg)
* [Multiple RaspberryPi logos bouncing around, v2](https://www.youtube.com/watch?v=u7DzPvkzEGA)

Contact
-------
You can find us over on IRC:

* Network: `irc.libera.chat`
* Port: 6667 (plain) or 6697 (TLS)
* `##raspberrypi-internals`

What works
----------

<table>
<thead>
<tr>
<th>Feature</th>
<th>RPi 1</th>
<th>RPi 2</th>
<th>RPi 3</th>
<th>RPi 4</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr>
<td>Composite NTSC video</td>
<td class="t_green">Works</td>
<td class="t_green">Works</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td></td>
</tr>
<tr>
<td>DSI video</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td></td>
</tr>
<tr>
<td>HDMI video</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
</tr>
<tr>
<td>DPI video</td>
<td class="t_green">Works</td>
<td class="t_green">Works</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td>Partially tested</td>
</tr>
<tr>
<td>V3D</td>
<td class="t_orange">Partial</td>
<td class="t_orange">Partial</td>
<td class="t_orange">Partial</td>
<td>Untested</td>
</tr>
<tr>
<td>2D composition</td>
<td class="t_green">Works</td>
<td class="t_green">Works</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td>Under firmware control</td>
</tr>
<tr>
<td>CSI</td>
<td>Untested</td>
<td>Untested</td>
<td>Untested</td>
<td>Untested</td>
</tr>
<tr>
<td>I2C host</td>
<td>Untested</td>
<td class="t_green">Works</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td>Under linux</td>
</tr>
<tr>
<td>SPI</td>
<td>Untested</td>
<td>Untested</td>
<td>Untested</td>
<td>Untested</td>
</tr>
<tr>
<td>ISP</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td>Lacks code</td>
</tr>
<tr>
<td>Video decoding acceleration</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td>Lacks code</td>
</tr>
<tr>
<td>PWM audio</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td class="t_red">Broken</td>
<td>Lacks code</td>
</tr>
<tr>
<td>Booting Linux</td>
<td>Untested</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td>Untested</td>
<td>RPi 2: only one core available to linux when using <code>app/linux-bootloader</code></td>
</tr>
<tr>
<td>Ethernet (including MAC address from RPi serial number)</td>
<td>Untested</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td>Untested</td>
</tr>
<tr>
<td>USB host</td>
<td>Untested</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td>Untested</td>
<td>Under Linux</td>
</tr>
<tr>
<td>SD/MicroSD</td>
<td>Untested</td>
<td class="t_green">Works</td>
<td>Untested</td>
<td>Untested</td>
<td>Works 95% of the time</td>
</tr>
</tbody>
</table>
