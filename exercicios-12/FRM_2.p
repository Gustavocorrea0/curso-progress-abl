DEFINE FRAME frame-principal
    WITH SIZE 80 BY 15
    CENTERED.
    
DEFINE FRAME frame-top-1
    WITH SIZE 60 BY 3
    AT ROW 3 COL 3. 
    
DEFINE FRAME frame-top-2
    WITH SIZE 20 BY 3
    AT ROW 7 COL 3.
    
DEFINE FRAME frame-top-3
    WITH SIZE 60 BY 3
    AT ROW 11 COL 3.
    
DEFINE FRAME frame-top-4
    WITH SIZE 20 BY 3
    AT ROW 7 COL 43.
    
FRAME frame-top-1:FRAME = FRAME frame-principal:HANDLE.
FRAME frame-top-2:FRAME = FRAME frame-principal:HANDLE.
FRAME frame-top-3:FRAME = FRAME frame-principal:HANDLE.
FRAME frame-top-4:FRAME = FRAME frame-principal:HANDLE.

VIEW FRAME frame-principal.
