project "box2d"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20" 
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"src/**.h",
		"src/**.cpp",
		"include/**.h",
		"../glm/glm/**.hpp",
        "../glm/glm/**.inl",
        "../glm/glm/glx/**.hpp",
        "../glm/glm/glx/**.inl", 
	}

	includedirs {
		"include",
		"src",
		"%{IncludeDir.glm}",
	}


	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "on"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"

	filter "configurations:Distribution"
        optimize "Full"
        runtime "Release"
        symbols "Off"
