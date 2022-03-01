# General warnings
WARNINGS 		:= -Wall 
WARNINGS 		+= -Wmissing-include-dirs 
WARNINGS 		+= -Wunused
WARNINGS 		+= -Wdisabled-optimization
WARNINGS 		+= -Wvla
WARNINGS 		+= -Wshadow
WARNINGS 		+= -Wno-unused-parameter
WARNINGS 		+= -Wredundant-decls

# Additional warnings
# Level 1
WARNING1 		:= -Wextra
WARNING1 		+= -Wmissing-format-attribute
WARNING1 		+= -Wmissing-prototypes
WARNING1 		+= -Wold-style-definition

# Level 2
WARNING2 		:= -Waggregate-return
WARNING2 		+= -Wcast-align
WARNING2 		+= -Wnested-externs

# Level 3
WARNING3 		:= -Wbad-function-cast
WARNING3 		+= -Wcast-qual
WARNING3 		+= -Wconversion
WARNING3 		+= -Wpacked
WARNING3 		+= -Wpointer-arith
WARNING3 		+= -Wswitch-default

# For gcc
GCC_WARING 		:= -Wunused-but-set-variable 
GCC_WARING 		+= -Wmaybe-uninitialized
GCC_WARING 		+= -Wpacked-bitfield-compat
GCC_WARING 		+= -Wshift-overflow=2
GCC_WARING 		+= -Wlogical-op

# For clang
CLANG_WARNING	:=-Wshift-overflow
CLANG_WARNING	+=-Wshift-sign-overflow
CLANG_WARNING	+=-Wlogical-op-parentheses