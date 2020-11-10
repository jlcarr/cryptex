# cryptex
An OpenSCAD script for modelling a cryptex.  

## Images
### Printed Result
#### Unlocked and Opened
![3D Printed Result](https://i1.lensdump.com/i/09eK4H.png)
#### Fully Assembled and Locked
![3D Printed Result_Assembled](https://i1.lensdump.com/i/0qCvzP.png)
#### Fully Disassembled
![3D Printed Result_Disassembled](https://i.lensdump.com/i/0qCLwm.png)


## What Is A Cryptex?
https://en.wikipedia.org/wiki/Cryptex  
A cryptex is a form of locked box in the shape of a cylinder.  
The lock is similar to a bicyle combination lock, with the discs encircling the body, and the secret compartment stored within the shaft.  
Cryptexes were popularized by Dan Brown in his novel The DaVinci Code.  

## Design
This piece was designed to be modular, efficient, and easy to update the geometry by editing the parameters and scripts for individual pieces. The assembly and printing of pieces can by explored and exported via the assmbly files.

The interlocking multi-part design of this piece was a challenge because of how the tolerances need to be taken into consideration.

### Files
#### Helpers
- **sharedgeometry**: This file contains geometry generating functions useful to multiple parts. In this case it contains the geometry to make a regular polygonal-based prism.
   - https://en.wikipedia.org/wiki/Regular_polygon
   - https://en.wikipedia.org/wiki/Prism_(geometry)
#### Parts
- **disc**: This file contains the geometry describing the rotating discs for the cryptex, with the digits extruded from the faces.
- **spindle**: This file contains the geometry describing the spindle upon which the discs rest, and houses the spindle. It has a tooth for each disc.
- **shaft**: This file contains the geometry describing the shaft (also known as the "pin") that slides into the spindle. The interior is hollow to hold the cryptex's secret contents. It has a tooth for each disc.
#### Assemblies
- **assembly**: This file contains the fully assembled cryptex. It should not be used for printing, as pieces can easily fuse together
- **printlayout**: This file contains all the pieces required to 3D print 1 cryptex, all laid out for easy printing.

### Parameters
- **n**: The number of faces on the discs. Not that going over 10 could cause issues with the digits which are extruded. (default 10)
- **inner_radius**: The radius of the spindle, which defines the inner radius of the discs, and that of the shaft. (default 13mm)
- **outer_radius**: The radius of the outer edge of the discs. (default 20mm)
- **width**: The width of each face of the discs. The height being defined by outer_radius. (default 10mm)
- **thickness**: The thickness of the walls. (default 2mm)
- **clearance**: The distance between faces that would ideally sit flush, which still being able to turn. This is related to the engineering tolerance. (default 0.5mm)
- **val**: This values is specific to each disc: it's the number that opens that disc.


## References
### OpenSCAD
- https://www.openscad.org/
- https://www.openscad.org/cheatsheet/index.html
### FreeCAD
- https://wiki.freecadweb.org/Import_OpenSCAD_code
- https://wiki.freecadweb.org/Manual:Generating_2D_drawings
- https://forum.freecadweb.org/viewtopic.php?t=35384
### Engineering Design
- https://en.wikipedia.org/wiki/Engineering_tolerance
- https://en.wikipedia.org/wiki/Engineering_fit
- https://en.wikipedia.org/wiki/Geometric_dimensioning_and_tolerancing
