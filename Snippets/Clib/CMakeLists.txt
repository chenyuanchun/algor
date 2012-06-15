SET(SYSTEST_SRC main.cpp
                Mmap.cpp 
                Math.cpp)

ADD_EXECUTABLE(clibtest ${SYSTEST_SRC})
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
