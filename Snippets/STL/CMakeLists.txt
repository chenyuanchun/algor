SET(SYSTEST_SRC main.cpp 
                Container.cpp)

ADD_EXECUTABLE(container ${SYSTEST_SRC})
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
