_G.package.path=_G.package.path..[[;./?.lua;./?/?.lua]]

assert( require 'premake.quickstart' )

local OS = os.get()
local settings = {
	links = {
		linux = { 'lua' },
		windows = { 'lua5.1' },
		macosx = { 'lua' , 'boost_chrono-mt'}
	}
}

local function platform_specifics()
	-- platform specific --
	configuration 'macosx'
		targetprefix ''
		targetextension '.so'
	configuration 'windows'
		includedirs { [[C:\Users\Public\lua\LuaRocks\2.1\include]] , os.getenv 'BOOST' }
		libdirs { [[C:\Users\Public\lua\LuaRocks\2.1]] , path.join(os.getenv'BOOST',[[stage\lib]]) }
	configuration { '*' }
end

------------------------
make_solution 'luconejo'
------------------------

includedirs { 
	'./rabbitmq-c/librabbitmq',
	'./SimpleAmqpClient/src',
	'./LuaBridge-1.0.2'
}

defines { 'BOOST_NO_VARIADIC_TEMPLATES' }

--------------------------
make_static_lib( 'rabbitmq',
	{
		'./rabbitmq-c/librabbitmq/*.h',
		'./rabbitmq-c/librabbitmq/*.c'
	}
)

excludes {
	'./rabbitmq-c/librabbitmq/amqp_cyassl.c',
	'./rabbitmq-c/librabbitmq/amqp_openssl.c',
	'./rabbitmq-c/librabbitmq/amqp_polarssl.c',
	'./rabbitmq-c/librabbitmq/amqp_gnutls.c'
}

language "C"

--------------------------
make_static_lib( 'SimpleAmqpClient',
	{
		'./SimpleAmqpClient/src/*.cpp',
		'./SimpleAmqpClient/src/**.h'
	}
)
language "C++"

----------------------------
make_shared_lib( 'luconejo',
	{
		'./src/*.h',
		'./src/*.cpp'
	}
)

targetdir '.'

language "C++"

links {
	'rabbitmq',
	'SimpleAmqpClient',
	settings.links[OS]
}

platform_specifics()

newaction {
   trigger     = "test",
   description = "run lua test",
   execute     = function ()
      os.execute("busted test/test_connection.lua")
      os.execute("busted test/test_channels.lua")
   end
}
