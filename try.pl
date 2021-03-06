#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
use lib "./";
use SvgGraph qw(:Basic :Shapes :Axis);

$SvgGraph::testmode = 1;
$SvgGraph::forceinit = 1;

newPage;

my $testnumber = 1;

if ($testnumber == 0) {
  plotPoint;
  for (my $i = 0; $i < 1000; $i++) {
    plot(200 + rand(200), 300 + rand(200));
  }

  setLineStyle(2);
  ellipticArc(300, 300, 200, 200, 0.0, 0.8, 30, 1);
  setLineStyle(0);
  ellipticArc(350, 300, 200, 200, 0.0, 0.8, 30, 1);
}

if ($testnumber == 1) {
  setChrSize(SvgGraph::TINY);
  axis(200, 350, 500, 0, -3.14, 3.14, 3.14/4.0, "%.2f", 1);
  axis(200, 100, 500, 2, -1.0, 1.0, 0.25, "%.2f", 1);

  mapDef(-3.14, -1.0, 3.14, 1.0, 200, 100, 699, 599);

  setColor(SvgGraph::GREEN);
  plotLine();
  for (my $phi = -SvgGraph::PI(); $phi <= SvgGraph::PI()+0.01; $phi += SvgGraph::PI()/20.0) {
    my $y = sin($phi);
    plot(mapX($phi), mapY($y));
  }
  setLineStyle(2);
  setColor(SvgGraph::BLUE);
  plotLine();
  for (my $phi = -SvgGraph::PI(); $phi <= SvgGraph::PI()+0.01; $phi += SvgGraph::PI()/20.0) {
    my $y = cos($phi);
    #plot(mapX($phi), mapY($y));
    plot(mapX(mapwX(mapX($phi))), mapY(mapwY(mapY($y))));
  }
  setLineStyle(0);
  setChrSize(SvgGraph::MEDIUM);
  home(0, 0);
  setColor(SvgGraph::HALFBRIGHT);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  setColor(SvgGraph::NORMALBRIGHT);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  setColor(SvgGraph::DOUBLEBRIGHT);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
  text("Neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit",  SvgGraph::NEWLINE);
}

endPage;
#copyPage;

