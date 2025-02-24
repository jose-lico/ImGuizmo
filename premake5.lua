project "ImGuizmo"
	kind "StaticLib"
	language "C++"
	configmap 
	{
		["ReleaseWithInfo"] = "Release",
		["ReleaseNoImGui"] = "Release"
	}

	targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

	files
	{
		"ImGuizmo.cpp",
		"include/ImGuizmo/ImGuizmo.h"
	}

	includedirs
	{
		"include/ImGuizmo",
		dependenciesDir .. "/imgui/include/imgui"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

	filter "system:linux"
		cppdialect "C++17"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
