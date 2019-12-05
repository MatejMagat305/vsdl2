module image

import nsauzede.vsdl2

#flag linux -lSDL2_image
#include <SDL_image.h>

// following kludge until `sdl2-config ...` is supported also on windows
#flag windows -I/msys64/mingw64/include/SDL2
#flag windows -L/msys64/mingw64/lib -lSDL2_image

//////////////////////////////////////////////////////////
// SDL_Image.h
//////////////////////////////////////////////////////////
//fn C.IMG_Load_RW(logo &vsdl2.RwOps, free_src int) &vsdl2.Surface
fn C.IMG_Init(flags int) int
fn C.IMG_Quit()
fn C.IMG_Load(file byteptr) voidptr

pub fn img_init(flags int) int {
	return C.IMG_Init(flags)
}

pub fn quit() {
	C.IMG_Quit()
}

pub fn load(file string) &vsdl2.Surface {
	res := C.IMG_Load(file.str)
	return res
}
