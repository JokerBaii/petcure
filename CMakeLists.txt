cmake_minimum_required(VERSION 3.16)
project(PetCure VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)

qt_add_executable(petcure main.cpp)
target_link_libraries(petcure PRIVATE Qt6::Core Qt6::Gui Qt6::Qml Qt6::Quick Qt6::QuickControls2)

file(GLOB_RECURSE APP_RESOURCES CONFIGURE_DEPENDS
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "qml/*.qml" "qml/qmldir" "assets/icons/*.svg")
list(APPEND APP_RESOURCES
    assets/images/welcome-banner.png
    assets/images/sleeping-puppy.png
    assets/images/cleaning-puppy.png
    assets/images/safety-puppy.png
    assets/images/empty-records-puppy.png)
qt_add_resources(petcure app_resources PREFIX "/" FILES ${APP_RESOURCES})
