if(APPLE)
	set(CONFIG_CMD cmake -DCMAKE_INSTALL_PREFIX=${ETH_DEPENDENCY_INSTALL_DIR} -DCMAKE_MODULE_PATH:PATH=${CMAKE_CURRENT_SOURCE_DIR} -DETH_DEPENDENCY_INSTALL_DIR:PATH=${ETH_DEPENDENCY_INSTALL_DIR} -DCMAKE_BUILD_TYPE=None -DCMAKE_FIND_FRAMEWORK=LAST -Wno-dev .)
else()
    set(CONFIG_CMD cmake -DCMAKE_INSTALL_PREFIX=${ETH_DEPENDENCY_INSTALL_DIR} -DCMAKE_MODULE_PATH:PATH=${CMAKE_CURRENT_SOURCE_DIR} -DETH_DEPENDENCY_INSTALL_DIR:PATH=${ETH_DEPENDENCY_INSTALL_DIR} -DCMAKE_BUILD_TYPE=None -DCMAKE_FIND_FRAMEWORK=LAST .)
endif()


# DO NOT CHANGE ANYTHING HERE!
ExternalProject_Add(json-cpp
    # DEPENDS curl # re-enable later, when we build curl again
	GIT_REPOSITORY https://github.com/open-source-parsers/jsoncpp.git
	BINARY_DIR json-cpp-prefix/src/json-cpp
        #CONFIGURE_COMMAND devenv json-cpp.sln /upgrade
        BUILD_COMMAND devenv jsoncpp.sln /build release
	INSTALL_COMMAND cmd /c cp C:\projects\cpp-ethereum\extdep\build\json-cpp-prefix\src\json-cpp\src\lib_json\Release\jsoncpp.lib ${ETH_DEPENDENCY_INSTALL_DIR}/lib && cp C:\projects\cpp-ethereum\extdep\build\json-cpp-prefix\src\json-cpp\src\lib_json\Release\*.h ${ETH_DEPENDENCY_INSTALL_DIR}/include/jsoncpp
)
