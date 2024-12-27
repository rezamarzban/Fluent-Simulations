// Mesh size
lc = 0.01; // Characteristic length for meshing

// Define points (explicit coordinates)
Point(1) = {0, 0, 0, lc};          // Bottom-left corner
Point(2) = {1.0, 0, 0, lc};        // Bottom-right corner (Length = 1.0 m)
Point(3) = {1.0, 0.05, 0, lc};    // Top-right corner (Length = 1.0 m, Diameter = 0.05 m)
Point(4) = {0, 0.05, 0, lc};      // Top-left corner (Diameter = 0.05 m)

// Define lines (boundaries)
Line(1) = {1, 2};   // Bottom wall (bottom)
Line(2) = {2, 3};   // Output boundary (right)
Line(3) = {3, 4};   // Top wall (top)
Line(4) = {4, 1};   // Input boundary (left)

// Define a closed curve (loop)
Line Loop(1) = {1, 2, 3, 4};

// Define the surface
Plane Surface(1) = {1};

// Define physical groups for boundaries
Physical Line("Input") = {4};   // Physical group for input
Physical Line("Walls") = {1, 3}; // Physical group for walls (top and bottom)
Physical Line("Output") = {2};  // Physical group for output

// Define physical group for the surface
Physical Surface("Tube") = {1};

// Mesh options (optional)
Mesh.Algorithm = 6; // Use Delaunay algorithm for meshing
