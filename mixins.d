// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/format/internal/write.d(1993,40)
(in ref int a) => a

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/format/spec.d(170,13)
private ubyte _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf;@property bool flDash() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 1U) != 0;}
@property void flDash(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 1U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))1U);}
@property bool flZero() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 2U) != 0;}
@property void flZero(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 2U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))2U);}
@property bool flSpace() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 4U) != 0;}
@property void flSpace(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 4U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))4U);}
@property bool flPlus() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 8U) != 0;}
@property void flPlus(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 8U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))8U);}
@property bool flHash() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 16U) != 0;}
@property void flHash(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 16U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))16U);}
@property bool flEqual() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 32U) != 0;}
@property void flEqual(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 32U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))32U);}
@property bool flSeparator() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 64U) != 0;}
@property void flSeparator(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 64U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))64U);}

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/variant.d(90,17)
T _field_0LU;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/variant.d(90,17)
T _field_1LU;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/variant.d(90,17)
T _field_2LU;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(445,13)
enum int schema = 0;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(445,13)
enum int sequence = 0;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(624,9)
alias _0LU = Identity!(field[0LU]);alias schema = _0LU;alias _1LU = Identity!(field[1LU]);alias sequence = _1LU;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(624,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/getopt.d(1122,5)
private ubyte _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf;@property bool caseSensitive() @safe pure nothrow @nogc const { return (_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf & 1U) != 0;}
@property void caseSensitive(bool v) @safe pure nothrow @nogc { if (v) _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf |= 1U;else _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf &= cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))(-1-cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))1U);}
@property bool bundling() @safe pure nothrow @nogc const { return (_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf & 2U) != 0;}
@property void bundling(bool v) @safe pure nothrow @nogc { if (v) _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf |= 2U;else _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf &= cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))(-1-cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))2U);}
@property bool passThrough() @safe pure nothrow @nogc const { return (_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf & 4U) != 0;}
@property void passThrough(bool v) @safe pure nothrow @nogc { if (v) _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf |= 4U;else _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf &= cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))(-1-cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))4U);}
@property bool stopOnFirstNonOption() @safe pure nothrow @nogc const { return (_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf & 8U) != 0;}
@property void stopOnFirstNonOption(bool v) @safe pure nothrow @nogc { if (v) _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf |= 8U;else _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf &= cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))(-1-cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))8U);}
@property bool keepEndOfOptions() @safe pure nothrow @nogc const { return (_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf & 16U) != 0;}
@property void keepEndOfOptions(bool v) @safe pure nothrow @nogc { if (v) _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf |= 16U;else _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf &= cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))(-1-cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))16U);}
@property bool required() @safe pure nothrow @nogc const { return (_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf & 32U) != 0;}
@property void required(bool v) @safe pure nothrow @nogc { if (v) _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf |= 32U;else _caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf &= cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))(-1-cast(typeof(_caseSensitive_bundling_passThrough_stopOnFirstNonOption_keepEndOfOptions_required__bf))32U);}

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/internal/memory.d(40,18)
onOutOfMemoryError();

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/stdio.d(5293,31)
core.stdc.stdio.stdin

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val-=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/stdio.d(5293,31)
core.stdc.stdio.stdout

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val-=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/stdio.d(5293,31)
core.stdc.stdio.stderr

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val+=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/core/atomic.d(576,9)
*cast(T*)&val-=mod

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(449,16)
cast(T)a < cast(T) b

// expansion at deps/bindbc-sdl/source/bindbc/sdl/codegen.d(13,1)
alias joinFnBinds = bindbc.common.codegen.joinFnBinds!false;
alias FnBind = bindbc.common.codegen.FnBind;

// expansion at deps/bindbc-sdl/source/sdl/assert_.d(36,1)
private nothrow @nogc{
	alias _pSDL_SetAssertionHandler = extern(C) void function(SDL_AssertionHandler handler, void* userData);
	alias _pSDL_GetAssertionReport = extern(C) const(SDL_assert_data)* function();
	alias _pSDL_ResetAssertionReport = extern(C) void function();
	alias _pSDL_GetAssertionHandler = extern(C) SDL_AssertionHandler function(void** pUserData);
	alias _pSDL_GetDefaultAssertionHandler = extern(C) SDL_AssertionHandler function();
}
__gshared nothrow @nogc{
	package _pSDL_SetAssertionHandler _SDL_SetAssertionHandler;
	extern(C) void SDL_SetAssertionHandler(SDL_AssertionHandler handler, void* userData){ _SDL_SetAssertionHandler(__traits(parameters)); }
	package _pSDL_GetAssertionReport _SDL_GetAssertionReport;
	extern(C) const(SDL_assert_data)* SDL_GetAssertionReport(){ return _SDL_GetAssertionReport(__traits(parameters)); }
	package _pSDL_ResetAssertionReport _SDL_ResetAssertionReport;
	extern(C) void SDL_ResetAssertionReport(){ _SDL_ResetAssertionReport(__traits(parameters)); }
	package _pSDL_GetAssertionHandler _SDL_GetAssertionHandler;
	extern(C) SDL_AssertionHandler SDL_GetAssertionHandler(void** pUserData){ return _SDL_GetAssertionHandler(__traits(parameters)); }
	package _pSDL_GetDefaultAssertionHandler _SDL_GetDefaultAssertionHandler;
	extern(C) SDL_AssertionHandler SDL_GetDefaultAssertionHandler(){ return _SDL_GetDefaultAssertionHandler(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_SetAssertionHandler, here.SDL_SetAssertionHandler.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetAssertionReport, here.SDL_GetAssertionReport.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ResetAssertionReport, here.SDL_ResetAssertionReport.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetAssertionHandler, here.SDL_GetAssertionHandler.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDefaultAssertionHandler, here.SDL_GetDefaultAssertionHandler.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/stdinc.d(133,1)
private nothrow @nogc{
	alias _pSDL_malloc = extern(C) void* function(size_t size);
	alias _pSDL_calloc = extern(C) void* function(size_t nMemB, size_t size);
	alias _pSDL_realloc = extern(C) void* function(void* mem, size_t size);
	alias _pSDL_free = extern(C) void function(void* mem);
	alias _pSDL_getenv = extern(C) char* function(const(char)* name);
	alias _pSDL_setenv = extern(C) int function(const(char)* name, const(char)* value, int overwrite);
	alias _pSDL_qsort = extern(C) void function(void* base, size_t nMemB, size_t size, int function(const(void)*, const(void)*) compare);
	alias _pSDL_abs = extern(C) int function(int x);
	alias _pSDL_isdigit = extern(C) int function(int x);
	alias _pSDL_isspace = extern(C) int function(int x);
	alias _pSDL_toupper = extern(C) int function(int x);
	alias _pSDL_tolower = extern(C) int function(int x);
	alias _pSDL_memset = extern(C) void* function(void* dst, int c, size_t len);
	alias _pSDL_memcpy = extern(C) void* function(void* dst, const(void)* src, size_t len);
	alias _pSDL_memmove = extern(C) void* function(void* dst, const(void)* src, size_t len);
	alias _pSDL_memcmp = extern(C) int function(const(void)* s1, const(void)* s2, size_t len);
	alias _pSDL_wcslen = extern(C) size_t function(const(wchar_t)* wStr);
	alias _pSDL_wcslcpy = extern(C) size_t function(wchar_t* dst, const(wchar_t)* src, size_t maxLen);
	alias _pSDL_wcslcat = extern(C) size_t function(wchar_t* dst, const(wchar_t)* src, size_t maxLen);
	alias _pSDL_strlen = extern(C) size_t function(const(char)* str);
	alias _pSDL_strlcpy = extern(C) size_t function(char* dst, const(char)* src, size_t maxLen);
	alias _pSDL_utf8strlcpy = extern(C) size_t function(char* dst, const(char)* src, size_t dstBytes);
	alias _pSDL_strlcat = extern(C) size_t function(char* dst, const(char)* src, size_t maxLen);
	alias _pSDL_strdup = extern(C) char* function(const(char)* str);
	alias _pSDL_strrev = extern(C) char* function(char* str);
	alias _pSDL_strupr = extern(C) char* function(char* str);
	alias _pSDL_strlwr = extern(C) char* function(char* str);
	alias _pSDL_strchr = extern(C) char* function(const(char)* str, int c);
	alias _pSDL_strrchr = extern(C) char* function(const(char)* str, int c);
	alias _pSDL_strstr = extern(C) char* function(const(char)* haystack, const(char)* needle);
	alias _pSDL_itoa = extern(C) char* function(int value, char* str, int radix);
	alias _pSDL_uitoa = extern(C) char* function(uint value, char* str, int radix);
	alias _pSDL_ltoa = extern(C) char* function(long value, char* str, int radix);
	alias _pSDL_ultoa = extern(C) char* function(ulong value, char* str, int radix);
	alias _pSDL_lltoa = extern(C) char* function(long value, char* str, int radix);
	alias _pSDL_ulltoa = extern(C) char* function(ulong value, char* str, int radix);
	alias _pSDL_atoi = extern(C) int function(const(char)* str);
	alias _pSDL_atof = extern(C) double function(const(char)* str);
	alias _pSDL_strtol = extern(C) long function(const(char)* str, char** endP, int base);
	alias _pSDL_strtoul = extern(C) ulong function(const(char)* str, char** endP, int base);
	alias _pSDL_strtoll = extern(C) long function(const(char)* str, char** endP, int base);
	alias _pSDL_strtoull = extern(C) ulong function(const(char)* str, char** endP, int base);
	alias _pSDL_strtod = extern(C) double function(const(char)* str, char** endP);
	alias _pSDL_strcmp = extern(C) int function(const(char)* str1, const(char)* str2);
	alias _pSDL_strncmp = extern(C) int function(const(char)* str1, const(char)* str2, size_t maxLen);
	alias _pSDL_strcasecmp = extern(C) int function(const(char)* str1, const(char)* str2);
	alias _pSDL_strncasecmp = extern(C) int function(const(char)* str1, const(char)* str2, size_t len);
	alias _pSDL_sscanf = extern(C) int function(const(char)* text, const(char)* fmt, ...);
	alias _pSDL_snprintf = extern(C) int function(char* text, size_t maxLen, const(char)* fmt, ...);
	alias _pSDL_vsnprintf = extern(C) int function(char* text, size_t maxLen, const(char)* fmt, va_list ap);
	alias _pSDL_atan = extern(C) double function(double x);
	alias _pSDL_atan2 = extern(C) double function(double y, double x);
	alias _pSDL_ceil = extern(C) double function(double x);
	alias _pSDL_copysign = extern(C) double function(double x, double y);
	alias _pSDL_cos = extern(C) double function(double x);
	alias _pSDL_cosf = extern(C) float function(float x);
	alias _pSDL_fabs = extern(C) double function(double x);
	alias _pSDL_floor = extern(C) double function(double x);
	alias _pSDL_log = extern(C) double function(double x);
	alias _pSDL_pow = extern(C) double function(double x, double y);
	alias _pSDL_scalbn = extern(C) double function(double x, int n);
	alias _pSDL_sin = extern(C) double function(double x);
	alias _pSDL_sinf = extern(C) float function(float x);
	alias _pSDL_sqrt = extern(C) double function(double x);
	alias _pSDL_iconv_open = extern(C) SDL_iconv_t* function(const(char)* toCode, const(char)* fromCode);
	alias _pSDL_iconv_close = extern(C) int function(SDL_iconv_t* cd);
	alias _pSDL_iconv = extern(C) size_t function(SDL_iconv_t* cd, const(char)** inBuf, size_t* inBytesLeft, char** outBuf, size_t* outBytesLeft);
	alias _pSDL_iconv_string = extern(C) char* function(const(char)* toCode, const(char)* fromCode, const(char)* inBuf, size_t inBytesLeft);
	alias _pSDL_vsscanf = extern(C) int function(const(char)* text, const(char)* fmt, va_list ap);
	alias _pSDL_acos = extern(C) double function(double x);
	alias _pSDL_asin = extern(C) double function(double x);
	alias _pSDL_tan = extern(C) double function(double x);
	alias _pSDL_tanf = extern(C) float function(float x);
	alias _pSDL_sqrtf = extern(C) float function(float x);
	alias _pSDL_wcscmp = extern(C) int function(const(wchar_t)* str1, const(wchar_t)* str2);
	alias _pSDL_utf8strlen = extern(C) size_t function(const(char)* str);
	alias _pSDL_GetMemoryFunctions = extern(C) void function(SDL_malloc_func* mallocFunc, SDL_calloc_func* callocFunc, SDL_realloc_func* reallocFunc, SDL_free_func* freeFunc);
	alias _pSDL_SetMemoryFunctions = extern(C) int function(SDL_malloc_func mallocFunc, SDL_calloc_func callocFunc, SDL_realloc_func reallocFunc, SDL_free_func freeFunc);
	alias _pSDL_GetNumAllocations = extern(C) int function();
	alias _pSDL_acosf = extern(C) float function(float x);
	alias _pSDL_asinf = extern(C) float function(float x);
	alias _pSDL_atanf = extern(C) float function(float x);
	alias _pSDL_atan2f = extern(C) float function(float y, float x);
	alias _pSDL_ceilf = extern(C) float function(float x);
	alias _pSDL_copysignf = extern(C) float function(float x, float y);
	alias _pSDL_fabsf = extern(C) float function(float x);
	alias _pSDL_floorf = extern(C) float function(float x);
	alias _pSDL_fmod = extern(C) double function(double x, double y);
	alias _pSDL_fmodf = extern(C) float function(float x, float y);
	alias _pSDL_logf = extern(C) float function(float x);
	alias _pSDL_log10 = extern(C) double function(double x);
	alias _pSDL_log10f = extern(C) float function(float x);
	alias _pSDL_powf = extern(C) float function(float x, float y);
	alias _pSDL_scalbnf = extern(C) float function(float x, int n);
	alias _pSDL_wcsdup = extern(C) wchar_t* function(const(wchar_t)* wstr);
	alias _pSDL_exp = extern(C) double function(double x);
	alias _pSDL_expf = extern(C) float function(float x);
	alias _pSDL_isupper = extern(C) int function(int x);
	alias _pSDL_islower = extern(C) int function(int x);
	alias _pSDL_wcsstr = extern(C) wchar_t* function(const(wchar_t)* haystack, const(wchar_t)* needle);
	alias _pSDL_wcsncmp = extern(C) int function(const(wchar_t)* str1, const(wchar_t)* str2, size_t maxLen);
	alias _pSDL_strtokr = extern(C) char* function(char* s1, const(char)* s2, char** savePtr);
	alias _pSDL_crc32 = extern(C) uint function(uint crc, const(void)* data, size_t len);
	alias _pSDL_wcscasecmp = extern(C) int function(const(wchar_t)* str1, const(wchar_t)* str2);
	alias _pSDL_wcsncasecmp = extern(C) int function(const(wchar_t)* str1, const(wchar_t)* str2, size_t len);
	alias _pSDL_trunc = extern(C) double function(double x);
	alias _pSDL_truncf = extern(C) float function(float x);
	alias _pSDL_isalpha = extern(C) int function(int x);
	alias _pSDL_isalnum = extern(C) int function(int x);
	alias _pSDL_isblank = extern(C) int function(int x);
	alias _pSDL_iscntrl = extern(C) int function(int x);
	alias _pSDL_isxdigit = extern(C) int function(int x);
	alias _pSDL_ispunct = extern(C) int function(int x);
	alias _pSDL_isprint = extern(C) int function(int x);
	alias _pSDL_isgraph = extern(C) int function(int x);
	alias _pSDL_round = extern(C) double function(double x);
	alias _pSDL_roundf = extern(C) float function(float x);
	alias _pSDL_lround = extern(C) long function(double x);
	alias _pSDL_lroundf = extern(C) long function(float x);
	alias _pSDL_asprintf = extern(C) int function(char** strP, const(char)* fmt, ...);
	alias _pSDL_vasprintf = extern(C) int function(char** strP, const(char)* fmt, va_list ap);
	alias _pSDL_GetOriginalMemoryFunctions = extern(C) void function(SDL_malloc_func* mallocFunc, SDL_calloc_func* callocFunc, SDL_realloc_func* reallocFunc, SDL_free_func* freeFunc);
	alias _pSDL_bsearch = extern(C) void* function(const(void)* key, const(void)* base, size_t nMemB, size_t size, int function(const(void)*, const(void)*) compare);
	alias _pSDL_crc16 = extern(C) ushort function(ushort crc, const(void)* data, size_t len);
	alias _pSDL_utf8strnlen = extern(C) size_t function(const(char)* str, size_t bytes);
	alias _pSDL_strcasestr = extern(C) char* function(const(char)* haystack, const(char)* needle);
}
__gshared nothrow @nogc{
	package _pSDL_malloc _SDL_malloc;
	extern(C) void* SDL_malloc(size_t size){ return _SDL_malloc(__traits(parameters)); }
	package _pSDL_calloc _SDL_calloc;
	extern(C) void* SDL_calloc(size_t nMemB, size_t size){ return _SDL_calloc(__traits(parameters)); }
	package _pSDL_realloc _SDL_realloc;
	extern(C) void* SDL_realloc(void* mem, size_t size){ return _SDL_realloc(__traits(parameters)); }
	package _pSDL_free _SDL_free;
	extern(C) void SDL_free(void* mem){ _SDL_free(__traits(parameters)); }
	package _pSDL_getenv _SDL_getenv;
	extern(C) char* SDL_getenv(const(char)* name){ return _SDL_getenv(__traits(parameters)); }
	package _pSDL_setenv _SDL_setenv;
	extern(C) int SDL_setenv(const(char)* name, const(char)* value, int overwrite){ return _SDL_setenv(__traits(parameters)); }
	package _pSDL_qsort _SDL_qsort;
	extern(C) void SDL_qsort(void* base, size_t nMemB, size_t size, int function(const(void)*, const(void)*) compare){ _SDL_qsort(__traits(parameters)); }
	package _pSDL_abs _SDL_abs;
	extern(C) int SDL_abs(int x){ return _SDL_abs(__traits(parameters)); }
	package _pSDL_isdigit _SDL_isdigit;
	extern(C) int SDL_isdigit(int x){ return _SDL_isdigit(__traits(parameters)); }
	package _pSDL_isspace _SDL_isspace;
	extern(C) int SDL_isspace(int x){ return _SDL_isspace(__traits(parameters)); }
	package _pSDL_toupper _SDL_toupper;
	extern(C) int SDL_toupper(int x){ return _SDL_toupper(__traits(parameters)); }
	package _pSDL_tolower _SDL_tolower;
	extern(C) int SDL_tolower(int x){ return _SDL_tolower(__traits(parameters)); }
	package _pSDL_memset _SDL_memset;
	extern(C) void* SDL_memset(void* dst, int c, size_t len){ return _SDL_memset(__traits(parameters)); }
	package _pSDL_memcpy _SDL_memcpy;
	extern(C) void* SDL_memcpy(void* dst, const(void)* src, size_t len){ return _SDL_memcpy(__traits(parameters)); }
	package _pSDL_memmove _SDL_memmove;
	extern(C) void* SDL_memmove(void* dst, const(void)* src, size_t len){ return _SDL_memmove(__traits(parameters)); }
	package _pSDL_memcmp _SDL_memcmp;
	extern(C) int SDL_memcmp(const(void)* s1, const(void)* s2, size_t len){ return _SDL_memcmp(__traits(parameters)); }
	package _pSDL_wcslen _SDL_wcslen;
	extern(C) size_t SDL_wcslen(const(wchar_t)* wStr){ return _SDL_wcslen(__traits(parameters)); }
	package _pSDL_wcslcpy _SDL_wcslcpy;
	extern(C) size_t SDL_wcslcpy(wchar_t* dst, const(wchar_t)* src, size_t maxLen){ return _SDL_wcslcpy(__traits(parameters)); }
	package _pSDL_wcslcat _SDL_wcslcat;
	extern(C) size_t SDL_wcslcat(wchar_t* dst, const(wchar_t)* src, size_t maxLen){ return _SDL_wcslcat(__traits(parameters)); }
	package _pSDL_strlen _SDL_strlen;
	extern(C) size_t SDL_strlen(const(char)* str){ return _SDL_strlen(__traits(parameters)); }
	package _pSDL_strlcpy _SDL_strlcpy;
	extern(C) size_t SDL_strlcpy(char* dst, const(char)* src, size_t maxLen){ return _SDL_strlcpy(__traits(parameters)); }
	package _pSDL_utf8strlcpy _SDL_utf8strlcpy;
	extern(C) size_t SDL_utf8strlcpy(char* dst, const(char)* src, size_t dstBytes){ return _SDL_utf8strlcpy(__traits(parameters)); }
	package _pSDL_strlcat _SDL_strlcat;
	extern(C) size_t SDL_strlcat(char* dst, const(char)* src, size_t maxLen){ return _SDL_strlcat(__traits(parameters)); }
	package _pSDL_strdup _SDL_strdup;
	extern(C) char* SDL_strdup(const(char)* str){ return _SDL_strdup(__traits(parameters)); }
	package _pSDL_strrev _SDL_strrev;
	extern(C) char* SDL_strrev(char* str){ return _SDL_strrev(__traits(parameters)); }
	package _pSDL_strupr _SDL_strupr;
	extern(C) char* SDL_strupr(char* str){ return _SDL_strupr(__traits(parameters)); }
	package _pSDL_strlwr _SDL_strlwr;
	extern(C) char* SDL_strlwr(char* str){ return _SDL_strlwr(__traits(parameters)); }
	package _pSDL_strchr _SDL_strchr;
	extern(C) char* SDL_strchr(const(char)* str, int c){ return _SDL_strchr(__traits(parameters)); }
	package _pSDL_strrchr _SDL_strrchr;
	extern(C) char* SDL_strrchr(const(char)* str, int c){ return _SDL_strrchr(__traits(parameters)); }
	package _pSDL_strstr _SDL_strstr;
	extern(C) char* SDL_strstr(const(char)* haystack, const(char)* needle){ return _SDL_strstr(__traits(parameters)); }
	package _pSDL_itoa _SDL_itoa;
	extern(C) char* SDL_itoa(int value, char* str, int radix){ return _SDL_itoa(__traits(parameters)); }
	package _pSDL_uitoa _SDL_uitoa;
	extern(C) char* SDL_uitoa(uint value, char* str, int radix){ return _SDL_uitoa(__traits(parameters)); }
	package _pSDL_ltoa _SDL_ltoa;
	extern(C) char* SDL_ltoa(long value, char* str, int radix){ return _SDL_ltoa(__traits(parameters)); }
	package _pSDL_ultoa _SDL_ultoa;
	extern(C) char* SDL_ultoa(ulong value, char* str, int radix){ return _SDL_ultoa(__traits(parameters)); }
	package _pSDL_lltoa _SDL_lltoa;
	extern(C) char* SDL_lltoa(long value, char* str, int radix){ return _SDL_lltoa(__traits(parameters)); }
	package _pSDL_ulltoa _SDL_ulltoa;
	extern(C) char* SDL_ulltoa(ulong value, char* str, int radix){ return _SDL_ulltoa(__traits(parameters)); }
	package _pSDL_atoi _SDL_atoi;
	extern(C) int SDL_atoi(const(char)* str){ return _SDL_atoi(__traits(parameters)); }
	package _pSDL_atof _SDL_atof;
	extern(C) double SDL_atof(const(char)* str){ return _SDL_atof(__traits(parameters)); }
	package _pSDL_strtol _SDL_strtol;
	extern(C) long SDL_strtol(const(char)* str, char** endP, int base){ return _SDL_strtol(__traits(parameters)); }
	package _pSDL_strtoul _SDL_strtoul;
	extern(C) ulong SDL_strtoul(const(char)* str, char** endP, int base){ return _SDL_strtoul(__traits(parameters)); }
	package _pSDL_strtoll _SDL_strtoll;
	extern(C) long SDL_strtoll(const(char)* str, char** endP, int base){ return _SDL_strtoll(__traits(parameters)); }
	package _pSDL_strtoull _SDL_strtoull;
	extern(C) ulong SDL_strtoull(const(char)* str, char** endP, int base){ return _SDL_strtoull(__traits(parameters)); }
	package _pSDL_strtod _SDL_strtod;
	extern(C) double SDL_strtod(const(char)* str, char** endP){ return _SDL_strtod(__traits(parameters)); }
	package _pSDL_strcmp _SDL_strcmp;
	extern(C) int SDL_strcmp(const(char)* str1, const(char)* str2){ return _SDL_strcmp(__traits(parameters)); }
	package _pSDL_strncmp _SDL_strncmp;
	extern(C) int SDL_strncmp(const(char)* str1, const(char)* str2, size_t maxLen){ return _SDL_strncmp(__traits(parameters)); }
	package _pSDL_strcasecmp _SDL_strcasecmp;
	extern(C) int SDL_strcasecmp(const(char)* str1, const(char)* str2){ return _SDL_strcasecmp(__traits(parameters)); }
	package _pSDL_strncasecmp _SDL_strncasecmp;
	extern(C) int SDL_strncasecmp(const(char)* str1, const(char)* str2, size_t len){ return _SDL_strncasecmp(__traits(parameters)); }
	_pSDL_sscanf SDL_sscanf;
	_pSDL_snprintf SDL_snprintf;
	package _pSDL_vsnprintf _SDL_vsnprintf;
	extern(C) int SDL_vsnprintf(char* text, size_t maxLen, const(char)* fmt, va_list ap){ return _SDL_vsnprintf(__traits(parameters)); }
	package _pSDL_atan _SDL_atan;
	extern(C) double SDL_atan(double x){ return _SDL_atan(__traits(parameters)); }
	package _pSDL_atan2 _SDL_atan2;
	extern(C) double SDL_atan2(double y, double x){ return _SDL_atan2(__traits(parameters)); }
	package _pSDL_ceil _SDL_ceil;
	extern(C) double SDL_ceil(double x){ return _SDL_ceil(__traits(parameters)); }
	package _pSDL_copysign _SDL_copysign;
	extern(C) double SDL_copysign(double x, double y){ return _SDL_copysign(__traits(parameters)); }
	package _pSDL_cos _SDL_cos;
	extern(C) double SDL_cos(double x){ return _SDL_cos(__traits(parameters)); }
	package _pSDL_cosf _SDL_cosf;
	extern(C) float SDL_cosf(float x){ return _SDL_cosf(__traits(parameters)); }
	package _pSDL_fabs _SDL_fabs;
	extern(C) double SDL_fabs(double x){ return _SDL_fabs(__traits(parameters)); }
	package _pSDL_floor _SDL_floor;
	extern(C) double SDL_floor(double x){ return _SDL_floor(__traits(parameters)); }
	package _pSDL_log _SDL_log;
	extern(C) double SDL_log(double x){ return _SDL_log(__traits(parameters)); }
	package _pSDL_pow _SDL_pow;
	extern(C) double SDL_pow(double x, double y){ return _SDL_pow(__traits(parameters)); }
	package _pSDL_scalbn _SDL_scalbn;
	extern(C) double SDL_scalbn(double x, int n){ return _SDL_scalbn(__traits(parameters)); }
	package _pSDL_sin _SDL_sin;
	extern(C) double SDL_sin(double x){ return _SDL_sin(__traits(parameters)); }
	package _pSDL_sinf _SDL_sinf;
	extern(C) float SDL_sinf(float x){ return _SDL_sinf(__traits(parameters)); }
	package _pSDL_sqrt _SDL_sqrt;
	extern(C) double SDL_sqrt(double x){ return _SDL_sqrt(__traits(parameters)); }
	package _pSDL_iconv_open _SDL_iconv_open;
	extern(C) SDL_iconv_t* SDL_iconv_open(const(char)* toCode, const(char)* fromCode){ return _SDL_iconv_open(__traits(parameters)); }
	package _pSDL_iconv_close _SDL_iconv_close;
	extern(C) int SDL_iconv_close(SDL_iconv_t* cd){ return _SDL_iconv_close(__traits(parameters)); }
	package _pSDL_iconv _SDL_iconv;
	extern(C) size_t SDL_iconv(SDL_iconv_t* cd, const(char)** inBuf, size_t* inBytesLeft, char** outBuf, size_t* outBytesLeft){ return _SDL_iconv(__traits(parameters)); }
	package _pSDL_iconv_string _SDL_iconv_string;
	extern(C) char* SDL_iconv_string(const(char)* toCode, const(char)* fromCode, const(char)* inBuf, size_t inBytesLeft){ return _SDL_iconv_string(__traits(parameters)); }
	package _pSDL_vsscanf _SDL_vsscanf;
	extern(C) int SDL_vsscanf(const(char)* text, const(char)* fmt, va_list ap){ return _SDL_vsscanf(__traits(parameters)); }
	package _pSDL_acos _SDL_acos;
	extern(C) double SDL_acos(double x){ return _SDL_acos(__traits(parameters)); }
	package _pSDL_asin _SDL_asin;
	extern(C) double SDL_asin(double x){ return _SDL_asin(__traits(parameters)); }
	package _pSDL_tan _SDL_tan;
	extern(C) double SDL_tan(double x){ return _SDL_tan(__traits(parameters)); }
	package _pSDL_tanf _SDL_tanf;
	extern(C) float SDL_tanf(float x){ return _SDL_tanf(__traits(parameters)); }
	package _pSDL_sqrtf _SDL_sqrtf;
	extern(C) float SDL_sqrtf(float x){ return _SDL_sqrtf(__traits(parameters)); }
	package _pSDL_wcscmp _SDL_wcscmp;
	extern(C) int SDL_wcscmp(const(wchar_t)* str1, const(wchar_t)* str2){ return _SDL_wcscmp(__traits(parameters)); }
	package _pSDL_utf8strlen _SDL_utf8strlen;
	extern(C) size_t SDL_utf8strlen(const(char)* str){ return _SDL_utf8strlen(__traits(parameters)); }
	package _pSDL_GetMemoryFunctions _SDL_GetMemoryFunctions;
	extern(C) void SDL_GetMemoryFunctions(SDL_malloc_func* mallocFunc, SDL_calloc_func* callocFunc, SDL_realloc_func* reallocFunc, SDL_free_func* freeFunc){ _SDL_GetMemoryFunctions(__traits(parameters)); }
	package _pSDL_SetMemoryFunctions _SDL_SetMemoryFunctions;
	extern(C) int SDL_SetMemoryFunctions(SDL_malloc_func mallocFunc, SDL_calloc_func callocFunc, SDL_realloc_func reallocFunc, SDL_free_func freeFunc){ return _SDL_SetMemoryFunctions(__traits(parameters)); }
	package _pSDL_GetNumAllocations _SDL_GetNumAllocations;
	extern(C) int SDL_GetNumAllocations(){ return _SDL_GetNumAllocations(__traits(parameters)); }
	package _pSDL_acosf _SDL_acosf;
	extern(C) float SDL_acosf(float x){ return _SDL_acosf(__traits(parameters)); }
	package _pSDL_asinf _SDL_asinf;
	extern(C) float SDL_asinf(float x){ return _SDL_asinf(__traits(parameters)); }
	package _pSDL_atanf _SDL_atanf;
	extern(C) float SDL_atanf(float x){ return _SDL_atanf(__traits(parameters)); }
	package _pSDL_atan2f _SDL_atan2f;
	extern(C) float SDL_atan2f(float y, float x){ return _SDL_atan2f(__traits(parameters)); }
	package _pSDL_ceilf _SDL_ceilf;
	extern(C) float SDL_ceilf(float x){ return _SDL_ceilf(__traits(parameters)); }
	package _pSDL_copysignf _SDL_copysignf;
	extern(C) float SDL_copysignf(float x, float y){ return _SDL_copysignf(__traits(parameters)); }
	package _pSDL_fabsf _SDL_fabsf;
	extern(C) float SDL_fabsf(float x){ return _SDL_fabsf(__traits(parameters)); }
	package _pSDL_floorf _SDL_floorf;
	extern(C) float SDL_floorf(float x){ return _SDL_floorf(__traits(parameters)); }
	package _pSDL_fmod _SDL_fmod;
	extern(C) double SDL_fmod(double x, double y){ return _SDL_fmod(__traits(parameters)); }
	package _pSDL_fmodf _SDL_fmodf;
	extern(C) float SDL_fmodf(float x, float y){ return _SDL_fmodf(__traits(parameters)); }
	package _pSDL_logf _SDL_logf;
	extern(C) float SDL_logf(float x){ return _SDL_logf(__traits(parameters)); }
	package _pSDL_log10 _SDL_log10;
	extern(C) double SDL_log10(double x){ return _SDL_log10(__traits(parameters)); }
	package _pSDL_log10f _SDL_log10f;
	extern(C) float SDL_log10f(float x){ return _SDL_log10f(__traits(parameters)); }
	package _pSDL_powf _SDL_powf;
	extern(C) float SDL_powf(float x, float y){ return _SDL_powf(__traits(parameters)); }
	package _pSDL_scalbnf _SDL_scalbnf;
	extern(C) float SDL_scalbnf(float x, int n){ return _SDL_scalbnf(__traits(parameters)); }
	package _pSDL_wcsdup _SDL_wcsdup;
	extern(C) wchar_t* SDL_wcsdup(const(wchar_t)* wstr){ return _SDL_wcsdup(__traits(parameters)); }
	package _pSDL_exp _SDL_exp;
	extern(C) double SDL_exp(double x){ return _SDL_exp(__traits(parameters)); }
	package _pSDL_expf _SDL_expf;
	extern(C) float SDL_expf(float x){ return _SDL_expf(__traits(parameters)); }
	package _pSDL_isupper _SDL_isupper;
	extern(C) int SDL_isupper(int x){ return _SDL_isupper(__traits(parameters)); }
	package _pSDL_islower _SDL_islower;
	extern(C) int SDL_islower(int x){ return _SDL_islower(__traits(parameters)); }
	package _pSDL_wcsstr _SDL_wcsstr;
	extern(C) wchar_t* SDL_wcsstr(const(wchar_t)* haystack, const(wchar_t)* needle){ return _SDL_wcsstr(__traits(parameters)); }
	package _pSDL_wcsncmp _SDL_wcsncmp;
	extern(C) int SDL_wcsncmp(const(wchar_t)* str1, const(wchar_t)* str2, size_t maxLen){ return _SDL_wcsncmp(__traits(parameters)); }
	package _pSDL_strtokr _SDL_strtokr;
	extern(C) char* SDL_strtokr(char* s1, const(char)* s2, char** savePtr){ return _SDL_strtokr(__traits(parameters)); }
	package _pSDL_crc32 _SDL_crc32;
	extern(C) uint SDL_crc32(uint crc, const(void)* data, size_t len){ return _SDL_crc32(__traits(parameters)); }
	package _pSDL_wcscasecmp _SDL_wcscasecmp;
	extern(C) int SDL_wcscasecmp(const(wchar_t)* str1, const(wchar_t)* str2){ return _SDL_wcscasecmp(__traits(parameters)); }
	package _pSDL_wcsncasecmp _SDL_wcsncasecmp;
	extern(C) int SDL_wcsncasecmp(const(wchar_t)* str1, const(wchar_t)* str2, size_t len){ return _SDL_wcsncasecmp(__traits(parameters)); }
	package _pSDL_trunc _SDL_trunc;
	extern(C) double SDL_trunc(double x){ return _SDL_trunc(__traits(parameters)); }
	package _pSDL_truncf _SDL_truncf;
	extern(C) float SDL_truncf(float x){ return _SDL_truncf(__traits(parameters)); }
	package _pSDL_isalpha _SDL_isalpha;
	extern(C) int SDL_isalpha(int x){ return _SDL_isalpha(__traits(parameters)); }
	package _pSDL_isalnum _SDL_isalnum;
	extern(C) int SDL_isalnum(int x){ return _SDL_isalnum(__traits(parameters)); }
	package _pSDL_isblank _SDL_isblank;
	extern(C) int SDL_isblank(int x){ return _SDL_isblank(__traits(parameters)); }
	package _pSDL_iscntrl _SDL_iscntrl;
	extern(C) int SDL_iscntrl(int x){ return _SDL_iscntrl(__traits(parameters)); }
	package _pSDL_isxdigit _SDL_isxdigit;
	extern(C) int SDL_isxdigit(int x){ return _SDL_isxdigit(__traits(parameters)); }
	package _pSDL_ispunct _SDL_ispunct;
	extern(C) int SDL_ispunct(int x){ return _SDL_ispunct(__traits(parameters)); }
	package _pSDL_isprint _SDL_isprint;
	extern(C) int SDL_isprint(int x){ return _SDL_isprint(__traits(parameters)); }
	package _pSDL_isgraph _SDL_isgraph;
	extern(C) int SDL_isgraph(int x){ return _SDL_isgraph(__traits(parameters)); }
	package _pSDL_round _SDL_round;
	extern(C) double SDL_round(double x){ return _SDL_round(__traits(parameters)); }
	package _pSDL_roundf _SDL_roundf;
	extern(C) float SDL_roundf(float x){ return _SDL_roundf(__traits(parameters)); }
	package _pSDL_lround _SDL_lround;
	extern(C) long SDL_lround(double x){ return _SDL_lround(__traits(parameters)); }
	package _pSDL_lroundf _SDL_lroundf;
	extern(C) long SDL_lroundf(float x){ return _SDL_lroundf(__traits(parameters)); }
	_pSDL_asprintf SDL_asprintf;
	package _pSDL_vasprintf _SDL_vasprintf;
	extern(C) int SDL_vasprintf(char** strP, const(char)* fmt, va_list ap){ return _SDL_vasprintf(__traits(parameters)); }
	package _pSDL_GetOriginalMemoryFunctions _SDL_GetOriginalMemoryFunctions;
	extern(C) void SDL_GetOriginalMemoryFunctions(SDL_malloc_func* mallocFunc, SDL_calloc_func* callocFunc, SDL_realloc_func* reallocFunc, SDL_free_func* freeFunc){ _SDL_GetOriginalMemoryFunctions(__traits(parameters)); }
	package _pSDL_bsearch _SDL_bsearch;
	extern(C) void* SDL_bsearch(const(void)* key, const(void)* base, size_t nMemB, size_t size, int function(const(void)*, const(void)*) compare){ return _SDL_bsearch(__traits(parameters)); }
	package _pSDL_crc16 _SDL_crc16;
	extern(C) ushort SDL_crc16(ushort crc, const(void)* data, size_t len){ return _SDL_crc16(__traits(parameters)); }
	package _pSDL_utf8strnlen _SDL_utf8strnlen;
	extern(C) size_t SDL_utf8strnlen(const(char)* str, size_t bytes){ return _SDL_utf8strnlen(__traits(parameters)); }
	package _pSDL_strcasestr _SDL_strcasestr;
	extern(C) char* SDL_strcasestr(const(char)* haystack, const(char)* needle){ return _SDL_strcasestr(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_malloc, here.SDL_malloc.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_calloc, here.SDL_calloc.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_realloc, here.SDL_realloc.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_free, here.SDL_free.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_getenv, here.SDL_getenv.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_setenv, here.SDL_setenv.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_qsort, here.SDL_qsort.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_abs, here.SDL_abs.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isdigit, here.SDL_isdigit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isspace, here.SDL_isspace.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_toupper, here.SDL_toupper.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_tolower, here.SDL_tolower.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_memset, here.SDL_memset.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_memcpy, here.SDL_memcpy.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_memmove, here.SDL_memmove.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_memcmp, here.SDL_memcmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcslen, here.SDL_wcslen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcslcpy, here.SDL_wcslcpy.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcslcat, here.SDL_wcslcat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strlen, here.SDL_strlen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strlcpy, here.SDL_strlcpy.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_utf8strlcpy, here.SDL_utf8strlcpy.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strlcat, here.SDL_strlcat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strdup, here.SDL_strdup.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strrev, here.SDL_strrev.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strupr, here.SDL_strupr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strlwr, here.SDL_strlwr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strchr, here.SDL_strchr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strrchr, here.SDL_strrchr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strstr, here.SDL_strstr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_itoa, here.SDL_itoa.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_uitoa, here.SDL_uitoa.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ltoa, here.SDL_ltoa.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ultoa, here.SDL_ultoa.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_lltoa, here.SDL_lltoa.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ulltoa, here.SDL_ulltoa.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_atoi, here.SDL_atoi.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_atof, here.SDL_atof.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strtol, here.SDL_strtol.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strtoul, here.SDL_strtoul.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strtoll, here.SDL_strtoll.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strtoull, here.SDL_strtoull.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strtod, here.SDL_strtod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strcmp, here.SDL_strcmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strncmp, here.SDL_strncmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strcasecmp, here.SDL_strcasecmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strncasecmp, here.SDL_strncasecmp.mangleof);
	lib.bindSymbol(cast(void**)&SDL_sscanf, "SDL_sscanf");
	lib.bindSymbol(cast(void**)&SDL_snprintf, "SDL_snprintf");
	lib.bindSymbol(cast(void**)&_SDL_vsnprintf, here.SDL_vsnprintf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_atan, here.SDL_atan.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_atan2, here.SDL_atan2.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ceil, here.SDL_ceil.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_copysign, here.SDL_copysign.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_cos, here.SDL_cos.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_cosf, here.SDL_cosf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_fabs, here.SDL_fabs.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_floor, here.SDL_floor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_log, here.SDL_log.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_pow, here.SDL_pow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_scalbn, here.SDL_scalbn.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_sin, here.SDL_sin.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_sinf, here.SDL_sinf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_sqrt, here.SDL_sqrt.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_iconv_open, here.SDL_iconv_open.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_iconv_close, here.SDL_iconv_close.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_iconv, here.SDL_iconv.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_iconv_string, here.SDL_iconv_string.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_vsscanf, here.SDL_vsscanf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_acos, here.SDL_acos.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_asin, here.SDL_asin.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_tan, here.SDL_tan.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_tanf, here.SDL_tanf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_sqrtf, here.SDL_sqrtf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcscmp, here.SDL_wcscmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_utf8strlen, here.SDL_utf8strlen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetMemoryFunctions, here.SDL_GetMemoryFunctions.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetMemoryFunctions, here.SDL_SetMemoryFunctions.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetNumAllocations, here.SDL_GetNumAllocations.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_acosf, here.SDL_acosf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_asinf, here.SDL_asinf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_atanf, here.SDL_atanf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_atan2f, here.SDL_atan2f.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ceilf, here.SDL_ceilf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_copysignf, here.SDL_copysignf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_fabsf, here.SDL_fabsf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_floorf, here.SDL_floorf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_fmod, here.SDL_fmod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_fmodf, here.SDL_fmodf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_logf, here.SDL_logf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_log10, here.SDL_log10.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_log10f, here.SDL_log10f.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_powf, here.SDL_powf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_scalbnf, here.SDL_scalbnf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcsdup, here.SDL_wcsdup.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_exp, here.SDL_exp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_expf, here.SDL_expf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isupper, here.SDL_isupper.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_islower, here.SDL_islower.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcsstr, here.SDL_wcsstr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcsncmp, here.SDL_wcsncmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strtokr, here.SDL_strtokr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_crc32, here.SDL_crc32.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcscasecmp, here.SDL_wcscasecmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_wcsncasecmp, here.SDL_wcsncasecmp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_trunc, here.SDL_trunc.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_truncf, here.SDL_truncf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isalpha, here.SDL_isalpha.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isalnum, here.SDL_isalnum.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isblank, here.SDL_isblank.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_iscntrl, here.SDL_iscntrl.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isxdigit, here.SDL_isxdigit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ispunct, here.SDL_ispunct.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isprint, here.SDL_isprint.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_isgraph, here.SDL_isgraph.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_round, here.SDL_round.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_roundf, here.SDL_roundf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_lround, here.SDL_lround.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_lroundf, here.SDL_lroundf.mangleof);
	lib.bindSymbol(cast(void**)&SDL_asprintf, "SDL_asprintf");
	lib.bindSymbol(cast(void**)&_SDL_vasprintf, here.SDL_vasprintf.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetOriginalMemoryFunctions, here.SDL_GetOriginalMemoryFunctions.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_bsearch, here.SDL_bsearch.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_crc16, here.SDL_crc16.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_utf8strnlen, here.SDL_utf8strnlen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_strcasestr, here.SDL_strcasestr.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/atomic.d(154,1)
private nothrow @nogc{
	alias _pSDL_AtomicTryLock = extern(C) SDL_bool function(SDL_SpinLock* lock);
	alias _pSDL_AtomicLock = extern(C) void function(SDL_SpinLock* lock);
	alias _pSDL_AtomicUnlock = extern(C) void function(SDL_SpinLock* lock);
	alias _pSDL_AtomicCAS = extern(C) SDL_bool function(SDL_atomic_t* a, int oldVal, int newVal);
	alias _pSDL_AtomicCASPtr = extern(C) SDL_bool function(void** a, void* oldVal, void* newVal);
	alias _pSDL_AtomicSet = extern(C) int function(SDL_atomic_t* a, int v);
	alias _pSDL_AtomicGet = extern(C) int function(SDL_atomic_t* a);
	alias _pSDL_AtomicAdd = extern(C) int function(SDL_atomic_t* a, int v);
	alias _pSDL_AtomicSetPtr = extern(C) void* function(void** a, void* v);
	alias _pSDL_AtomicGetPtr = extern(C) void* function(void** a);
	alias _pSDL_MemoryBarrierReleaseFunction = extern(C) void function();
	alias _pSDL_MemoryBarrierAcquireFunction = extern(C) void function();
}
__gshared nothrow @nogc{
	package _pSDL_AtomicTryLock _SDL_AtomicTryLock;
	extern(C) SDL_bool SDL_AtomicTryLock(SDL_SpinLock* lock){ return _SDL_AtomicTryLock(__traits(parameters)); }
	package _pSDL_AtomicLock _SDL_AtomicLock;
	extern(C) void SDL_AtomicLock(SDL_SpinLock* lock){ _SDL_AtomicLock(__traits(parameters)); }
	package _pSDL_AtomicUnlock _SDL_AtomicUnlock;
	extern(C) void SDL_AtomicUnlock(SDL_SpinLock* lock){ _SDL_AtomicUnlock(__traits(parameters)); }
	package _pSDL_AtomicCAS _SDL_AtomicCAS;
	extern(C) SDL_bool SDL_AtomicCAS(SDL_atomic_t* a, int oldVal, int newVal){ return _SDL_AtomicCAS(__traits(parameters)); }
	package _pSDL_AtomicCASPtr _SDL_AtomicCASPtr;
	extern(C) SDL_bool SDL_AtomicCASPtr(void** a, void* oldVal, void* newVal){ return _SDL_AtomicCASPtr(__traits(parameters)); }
	package _pSDL_AtomicSet _SDL_AtomicSet;
	extern(C) int SDL_AtomicSet(SDL_atomic_t* a, int v){ return _SDL_AtomicSet(__traits(parameters)); }
	package _pSDL_AtomicGet _SDL_AtomicGet;
	extern(C) int SDL_AtomicGet(SDL_atomic_t* a){ return _SDL_AtomicGet(__traits(parameters)); }
	package _pSDL_AtomicAdd _SDL_AtomicAdd;
	extern(C) int SDL_AtomicAdd(SDL_atomic_t* a, int v){ return _SDL_AtomicAdd(__traits(parameters)); }
	package _pSDL_AtomicSetPtr _SDL_AtomicSetPtr;
	extern(C) void* SDL_AtomicSetPtr(void** a, void* v){ return _SDL_AtomicSetPtr(__traits(parameters)); }
	package _pSDL_AtomicGetPtr _SDL_AtomicGetPtr;
	extern(C) void* SDL_AtomicGetPtr(void** a){ return _SDL_AtomicGetPtr(__traits(parameters)); }
	package _pSDL_MemoryBarrierReleaseFunction _SDL_MemoryBarrierReleaseFunction;
	extern(C) void SDL_MemoryBarrierReleaseFunction(){ _SDL_MemoryBarrierReleaseFunction(__traits(parameters)); }
	package _pSDL_MemoryBarrierAcquireFunction _SDL_MemoryBarrierAcquireFunction;
	extern(C) void SDL_MemoryBarrierAcquireFunction(){ _SDL_MemoryBarrierAcquireFunction(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_AtomicTryLock, here.SDL_AtomicTryLock.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicLock, here.SDL_AtomicLock.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicUnlock, here.SDL_AtomicUnlock.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicCAS, here.SDL_AtomicCAS.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicCASPtr, here.SDL_AtomicCASPtr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicSet, here.SDL_AtomicSet.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicGet, here.SDL_AtomicGet.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicAdd, here.SDL_AtomicAdd.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicSetPtr, here.SDL_AtomicSetPtr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AtomicGetPtr, here.SDL_AtomicGetPtr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MemoryBarrierReleaseFunction, here.SDL_MemoryBarrierReleaseFunction.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MemoryBarrierAcquireFunction, here.SDL_MemoryBarrierAcquireFunction.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/rwops.d(106,1)
private nothrow @nogc{
	alias _pSDL_RWFromFile = extern(C) SDL_RWops* function(const(char)* file, const(char)* mode);
	alias _pSDL_RWFromMem = extern(C) SDL_RWops* function(void* mem, int size);
	alias _pSDL_RWFromConstMem = extern(C) SDL_RWops* function(const(void)* mem, int size);
	alias _pSDL_AllocRW = extern(C) SDL_RWops* function();
	alias _pSDL_FreeRW = extern(C) void function(SDL_RWops* context);
	alias _pSDL_ReadU8 = extern(C) ubyte function(SDL_RWops* context);
	alias _pSDL_ReadLE16 = extern(C) ushort function(SDL_RWops* context);
	alias _pSDL_ReadBE16 = extern(C) ushort function(SDL_RWops* context);
	alias _pSDL_ReadLE32 = extern(C) uint function(SDL_RWops* context);
	alias _pSDL_ReadBE32 = extern(C) uint function(SDL_RWops* context);
	alias _pSDL_ReadLE64 = extern(C) ulong function(SDL_RWops* context);
	alias _pSDL_ReadBE64 = extern(C) ulong function(SDL_RWops* context);
	alias _pSDL_WriteU8 = extern(C) size_t function(SDL_RWops* context, ubyte value);
	alias _pSDL_WriteLE16 = extern(C) size_t function(SDL_RWops* context, ushort value);
	alias _pSDL_WriteBE16 = extern(C) size_t function(SDL_RWops* context, ushort value);
	alias _pSDL_WriteLE32 = extern(C) size_t function(SDL_RWops* context, uint value);
	alias _pSDL_WriteBE32 = extern(C) size_t function(SDL_RWops* context, uint value);
	alias _pSDL_WriteLE64 = extern(C) size_t function(SDL_RWops* context, ulong value);
	alias _pSDL_WriteBE64 = extern(C) size_t function(SDL_RWops* context, ulong value);
	alias _pSDL_RWFromFP = extern(C) SDL_RWops* function(FILE* ffp, SDL_bool autoClose);
	alias _pSDL_LoadFile_RW = extern(C) void* function(SDL_RWops* context, size_t dataSize, int freeSrc);
	alias _pSDL_RWsize = extern(C) long function(SDL_RWops* context);
	alias _pSDL_RWseek = extern(C) long function(SDL_RWops* context, long offset, int whence);
	alias _pSDL_RWtell = extern(C) long function(SDL_RWops* context);
	alias _pSDL_RWread = extern(C) size_t function(SDL_RWops* context, void* ptr, size_t size, size_t maxNum);
	alias _pSDL_RWwrite = extern(C) size_t function(SDL_RWops* context, const(void)* ptr, size_t size, size_t num);
	alias _pSDL_RWclose = extern(C) int function(SDL_RWops* context);
}
__gshared nothrow @nogc{
	package _pSDL_RWFromFile _SDL_RWFromFile;
	extern(C) SDL_RWops* SDL_RWFromFile(const(char)* file, const(char)* mode){ return _SDL_RWFromFile(__traits(parameters)); }
	package _pSDL_RWFromMem _SDL_RWFromMem;
	extern(C) SDL_RWops* SDL_RWFromMem(void* mem, int size){ return _SDL_RWFromMem(__traits(parameters)); }
	package _pSDL_RWFromConstMem _SDL_RWFromConstMem;
	extern(C) SDL_RWops* SDL_RWFromConstMem(const(void)* mem, int size){ return _SDL_RWFromConstMem(__traits(parameters)); }
	package _pSDL_AllocRW _SDL_AllocRW;
	extern(C) SDL_RWops* SDL_AllocRW(){ return _SDL_AllocRW(__traits(parameters)); }
	package _pSDL_FreeRW _SDL_FreeRW;
	extern(C) void SDL_FreeRW(SDL_RWops* context){ _SDL_FreeRW(__traits(parameters)); }
	package _pSDL_ReadU8 _SDL_ReadU8;
	extern(C) ubyte SDL_ReadU8(SDL_RWops* context){ return _SDL_ReadU8(__traits(parameters)); }
	package _pSDL_ReadLE16 _SDL_ReadLE16;
	extern(C) ushort SDL_ReadLE16(SDL_RWops* context){ return _SDL_ReadLE16(__traits(parameters)); }
	package _pSDL_ReadBE16 _SDL_ReadBE16;
	extern(C) ushort SDL_ReadBE16(SDL_RWops* context){ return _SDL_ReadBE16(__traits(parameters)); }
	package _pSDL_ReadLE32 _SDL_ReadLE32;
	extern(C) uint SDL_ReadLE32(SDL_RWops* context){ return _SDL_ReadLE32(__traits(parameters)); }
	package _pSDL_ReadBE32 _SDL_ReadBE32;
	extern(C) uint SDL_ReadBE32(SDL_RWops* context){ return _SDL_ReadBE32(__traits(parameters)); }
	package _pSDL_ReadLE64 _SDL_ReadLE64;
	extern(C) ulong SDL_ReadLE64(SDL_RWops* context){ return _SDL_ReadLE64(__traits(parameters)); }
	package _pSDL_ReadBE64 _SDL_ReadBE64;
	extern(C) ulong SDL_ReadBE64(SDL_RWops* context){ return _SDL_ReadBE64(__traits(parameters)); }
	package _pSDL_WriteU8 _SDL_WriteU8;
	extern(C) size_t SDL_WriteU8(SDL_RWops* context, ubyte value){ return _SDL_WriteU8(__traits(parameters)); }
	package _pSDL_WriteLE16 _SDL_WriteLE16;
	extern(C) size_t SDL_WriteLE16(SDL_RWops* context, ushort value){ return _SDL_WriteLE16(__traits(parameters)); }
	package _pSDL_WriteBE16 _SDL_WriteBE16;
	extern(C) size_t SDL_WriteBE16(SDL_RWops* context, ushort value){ return _SDL_WriteBE16(__traits(parameters)); }
	package _pSDL_WriteLE32 _SDL_WriteLE32;
	extern(C) size_t SDL_WriteLE32(SDL_RWops* context, uint value){ return _SDL_WriteLE32(__traits(parameters)); }
	package _pSDL_WriteBE32 _SDL_WriteBE32;
	extern(C) size_t SDL_WriteBE32(SDL_RWops* context, uint value){ return _SDL_WriteBE32(__traits(parameters)); }
	package _pSDL_WriteLE64 _SDL_WriteLE64;
	extern(C) size_t SDL_WriteLE64(SDL_RWops* context, ulong value){ return _SDL_WriteLE64(__traits(parameters)); }
	package _pSDL_WriteBE64 _SDL_WriteBE64;
	extern(C) size_t SDL_WriteBE64(SDL_RWops* context, ulong value){ return _SDL_WriteBE64(__traits(parameters)); }
	package _pSDL_RWFromFP _SDL_RWFromFP;
	extern(C) SDL_RWops* SDL_RWFromFP(FILE* ffp, SDL_bool autoClose){ return _SDL_RWFromFP(__traits(parameters)); }
	package _pSDL_LoadFile_RW _SDL_LoadFile_RW;
	extern(C) void* SDL_LoadFile_RW(SDL_RWops* context, size_t dataSize, int freeSrc){ return _SDL_LoadFile_RW(__traits(parameters)); }
	package _pSDL_RWsize _SDL_RWsize;
	extern(C) long SDL_RWsize(SDL_RWops* context){ return _SDL_RWsize(__traits(parameters)); }
	package _pSDL_RWseek _SDL_RWseek;
	extern(C) long SDL_RWseek(SDL_RWops* context, long offset, int whence){ return _SDL_RWseek(__traits(parameters)); }
	package _pSDL_RWtell _SDL_RWtell;
	extern(C) long SDL_RWtell(SDL_RWops* context){ return _SDL_RWtell(__traits(parameters)); }
	package _pSDL_RWread _SDL_RWread;
	extern(C) size_t SDL_RWread(SDL_RWops* context, void* ptr, size_t size, size_t maxNum){ return _SDL_RWread(__traits(parameters)); }
	package _pSDL_RWwrite _SDL_RWwrite;
	extern(C) size_t SDL_RWwrite(SDL_RWops* context, const(void)* ptr, size_t size, size_t num){ return _SDL_RWwrite(__traits(parameters)); }
	package _pSDL_RWclose _SDL_RWclose;
	extern(C) int SDL_RWclose(SDL_RWops* context){ return _SDL_RWclose(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_RWFromFile, here.SDL_RWFromFile.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWFromMem, here.SDL_RWFromMem.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWFromConstMem, here.SDL_RWFromConstMem.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AllocRW, here.SDL_AllocRW.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FreeRW, here.SDL_FreeRW.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ReadU8, here.SDL_ReadU8.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ReadLE16, here.SDL_ReadLE16.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ReadBE16, here.SDL_ReadBE16.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ReadLE32, here.SDL_ReadLE32.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ReadBE32, here.SDL_ReadBE32.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ReadLE64, here.SDL_ReadLE64.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ReadBE64, here.SDL_ReadBE64.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WriteU8, here.SDL_WriteU8.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WriteLE16, here.SDL_WriteLE16.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WriteBE16, here.SDL_WriteBE16.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WriteLE32, here.SDL_WriteLE32.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WriteBE32, here.SDL_WriteBE32.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WriteLE64, here.SDL_WriteLE64.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WriteBE64, here.SDL_WriteBE64.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWFromFP, here.SDL_RWFromFP.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LoadFile_RW, here.SDL_LoadFile_RW.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWsize, here.SDL_RWsize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWseek, here.SDL_RWseek.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWtell, here.SDL_RWtell.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWread, here.SDL_RWread.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWwrite, here.SDL_RWwrite.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RWclose, here.SDL_RWclose.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/audio.d(142,1)
private nothrow @nogc{
	alias _pSDL_GetNumAudioDrivers = extern(C) int function();
	alias _pSDL_GetAudioDriver = extern(C) const(char)* function(int index);
	alias _pSDL_AudioInit = extern(C) int function(const(char)* driverName);
	alias _pSDL_AudioQuit = extern(C) void function();
	alias _pSDL_GetCurrentAudioDriver = extern(C) const(char)* function();
	alias _pSDL_OpenAudio = extern(C) int function(SDL_AudioSpec* desired, SDL_AudioSpec* obtained);
	alias _pSDL_GetNumAudioDevices = extern(C) int function(int isCapture);
	alias _pSDL_GetAudioDeviceName = extern(C) const(char)* function(int index, int isCapture);
	alias _pSDL_OpenAudioDevice = extern(C) SDL_AudioDeviceID function(const(char)* device, int isCapture, const(SDL_AudioSpec)* desired, SDL_AudioSpec* obtained, int allowedChanges);
	alias _pSDL_GetAudioStatus = extern(C) SDL_AudioStatus function();
	alias _pSDL_GetAudioDeviceStatus = extern(C) SDL_AudioStatus function(SDL_AudioDeviceID dev);
	alias _pSDL_PauseAudio = extern(C) void function(int pauseOn);
	alias _pSDL_PauseAudioDevice = extern(C) void function(SDL_AudioDeviceID dev, int pauseOn);
	alias _pSDL_LoadWAV_RW = extern(C) SDL_AudioSpec* function(SDL_RWops* src, int freeSrc, SDL_AudioSpec* spec, ubyte** audioBuf, uint* audioLen);
	alias _pSDL_FreeWAV = extern(C) void function(ubyte* audioBuf);
	alias _pSDL_BuildAudioCVT = extern(C) int function(SDL_AudioCVT* cvt, SDL_AudioFormat srcFormat, ubyte srcChannels, int srcRate, SDL_AudioFormat dstFormat, ubyte dstChannels, int dstRate);
	alias _pSDL_ConvertAudio = extern(C) int function(SDL_AudioCVT* cvt);
	alias _pSDL_MixAudio = extern(C) void function(ubyte* dst, const(ubyte)* src, uint len, int volume);
	alias _pSDL_MixAudioFormat = extern(C) void function(ubyte* dst, const(ubyte)* src, SDL_AudioFormat format, uint len, int volume);
	alias _pSDL_LockAudio = extern(C) void function();
	alias _pSDL_LockAudioDevice = extern(C) void function(SDL_AudioDeviceID dev);
	alias _pSDL_UnlockAudio = extern(C) void function();
	alias _pSDL_UnlockAudioDevice = extern(C) void function(SDL_AudioDeviceID dev);
	alias _pSDL_CloseAudio = extern(C) void function();
	alias _pSDL_CloseAudioDevice = extern(C) void function(SDL_AudioDeviceID dev);
	alias _pSDL_QueueAudio = extern(C) int function(SDL_AudioDeviceID dev, const(void)* data, uint len);
	alias _pSDL_ClearQueuedAudio = extern(C) int function(SDL_AudioDeviceID dev);
	alias _pSDL_GetQueuedAudioSize = extern(C) int function(SDL_AudioDeviceID dev);
	alias _pSDL_DequeueAudio = extern(C) uint function(SDL_AudioDeviceID dev, void* data, uint len);
	alias _pSDL_NewAudioStream = extern(C) SDL_AudioStream* function(const SDL_AudioFormat srcFormat, const ubyte srcChannels, const int srcRate, const SDL_AudioFormat dstFormat, const ubyte dstChannels, const int dstRate);
	alias _pSDL_AudioStreamPut = extern(C) int function(SDL_AudioStream* stream, const(void)* buf, int len);
	alias _pSDL_AudioStreamGet = extern(C) int function(SDL_AudioStream* stream, void* buf, int len);
	alias _pSDL_AudioStreamAvailable = extern(C) int function(SDL_AudioStream* stream);
	alias _pSDL_AudioStreamFlush = extern(C) int function(SDL_AudioStream* stream);
	alias _pSDL_AudioStreamClear = extern(C) void function(SDL_AudioStream* stream);
	alias _pSDL_FreeAudioStream = extern(C) void function(SDL_AudioStream* stream);
	alias _pSDL_GetAudioDeviceSpec = extern(C) int function(int index, int isCapture, SDL_AudioSpec* spec);
	alias _pSDL_GetDefaultAudioInfo = extern(C) int function(char** name, SDL_AudioSpec* spec, int isCapture);
}
__gshared nothrow @nogc{
	package _pSDL_GetNumAudioDrivers _SDL_GetNumAudioDrivers;
	extern(C) int SDL_GetNumAudioDrivers(){ return _SDL_GetNumAudioDrivers(__traits(parameters)); }
	package _pSDL_GetAudioDriver _SDL_GetAudioDriver;
	extern(C) const(char)* SDL_GetAudioDriver(int index){ return _SDL_GetAudioDriver(__traits(parameters)); }
	package _pSDL_AudioInit _SDL_AudioInit;
	extern(C) int SDL_AudioInit(const(char)* driverName){ return _SDL_AudioInit(__traits(parameters)); }
	package _pSDL_AudioQuit _SDL_AudioQuit;
	extern(C) void SDL_AudioQuit(){ _SDL_AudioQuit(__traits(parameters)); }
	package _pSDL_GetCurrentAudioDriver _SDL_GetCurrentAudioDriver;
	extern(C) const(char)* SDL_GetCurrentAudioDriver(){ return _SDL_GetCurrentAudioDriver(__traits(parameters)); }
	package _pSDL_OpenAudio _SDL_OpenAudio;
	extern(C) int SDL_OpenAudio(SDL_AudioSpec* desired, SDL_AudioSpec* obtained){ return _SDL_OpenAudio(__traits(parameters)); }
	package _pSDL_GetNumAudioDevices _SDL_GetNumAudioDevices;
	extern(C) int SDL_GetNumAudioDevices(int isCapture){ return _SDL_GetNumAudioDevices(__traits(parameters)); }
	package _pSDL_GetAudioDeviceName _SDL_GetAudioDeviceName;
	extern(C) const(char)* SDL_GetAudioDeviceName(int index, int isCapture){ return _SDL_GetAudioDeviceName(__traits(parameters)); }
	package _pSDL_OpenAudioDevice _SDL_OpenAudioDevice;
	extern(C) SDL_AudioDeviceID SDL_OpenAudioDevice(const(char)* device, int isCapture, const(SDL_AudioSpec)* desired, SDL_AudioSpec* obtained, int allowedChanges){ return _SDL_OpenAudioDevice(__traits(parameters)); }
	package _pSDL_GetAudioStatus _SDL_GetAudioStatus;
	extern(C) SDL_AudioStatus SDL_GetAudioStatus(){ return _SDL_GetAudioStatus(__traits(parameters)); }
	package _pSDL_GetAudioDeviceStatus _SDL_GetAudioDeviceStatus;
	extern(C) SDL_AudioStatus SDL_GetAudioDeviceStatus(SDL_AudioDeviceID dev){ return _SDL_GetAudioDeviceStatus(__traits(parameters)); }
	package _pSDL_PauseAudio _SDL_PauseAudio;
	extern(C) void SDL_PauseAudio(int pauseOn){ _SDL_PauseAudio(__traits(parameters)); }
	package _pSDL_PauseAudioDevice _SDL_PauseAudioDevice;
	extern(C) void SDL_PauseAudioDevice(SDL_AudioDeviceID dev, int pauseOn){ _SDL_PauseAudioDevice(__traits(parameters)); }
	package _pSDL_LoadWAV_RW _SDL_LoadWAV_RW;
	extern(C) SDL_AudioSpec* SDL_LoadWAV_RW(SDL_RWops* src, int freeSrc, SDL_AudioSpec* spec, ubyte** audioBuf, uint* audioLen){ return _SDL_LoadWAV_RW(__traits(parameters)); }
	package _pSDL_FreeWAV _SDL_FreeWAV;
	extern(C) void SDL_FreeWAV(ubyte* audioBuf){ _SDL_FreeWAV(__traits(parameters)); }
	package _pSDL_BuildAudioCVT _SDL_BuildAudioCVT;
	extern(C) int SDL_BuildAudioCVT(SDL_AudioCVT* cvt, SDL_AudioFormat srcFormat, ubyte srcChannels, int srcRate, SDL_AudioFormat dstFormat, ubyte dstChannels, int dstRate){ return _SDL_BuildAudioCVT(__traits(parameters)); }
	package _pSDL_ConvertAudio _SDL_ConvertAudio;
	extern(C) int SDL_ConvertAudio(SDL_AudioCVT* cvt){ return _SDL_ConvertAudio(__traits(parameters)); }
	package _pSDL_MixAudio _SDL_MixAudio;
	extern(C) void SDL_MixAudio(ubyte* dst, const(ubyte)* src, uint len, int volume){ _SDL_MixAudio(__traits(parameters)); }
	package _pSDL_MixAudioFormat _SDL_MixAudioFormat;
	extern(C) void SDL_MixAudioFormat(ubyte* dst, const(ubyte)* src, SDL_AudioFormat format, uint len, int volume){ _SDL_MixAudioFormat(__traits(parameters)); }
	package _pSDL_LockAudio _SDL_LockAudio;
	extern(C) void SDL_LockAudio(){ _SDL_LockAudio(__traits(parameters)); }
	package _pSDL_LockAudioDevice _SDL_LockAudioDevice;
	extern(C) void SDL_LockAudioDevice(SDL_AudioDeviceID dev){ _SDL_LockAudioDevice(__traits(parameters)); }
	package _pSDL_UnlockAudio _SDL_UnlockAudio;
	extern(C) void SDL_UnlockAudio(){ _SDL_UnlockAudio(__traits(parameters)); }
	package _pSDL_UnlockAudioDevice _SDL_UnlockAudioDevice;
	extern(C) void SDL_UnlockAudioDevice(SDL_AudioDeviceID dev){ _SDL_UnlockAudioDevice(__traits(parameters)); }
	package _pSDL_CloseAudio _SDL_CloseAudio;
	extern(C) void SDL_CloseAudio(){ _SDL_CloseAudio(__traits(parameters)); }
	package _pSDL_CloseAudioDevice _SDL_CloseAudioDevice;
	extern(C) void SDL_CloseAudioDevice(SDL_AudioDeviceID dev){ _SDL_CloseAudioDevice(__traits(parameters)); }
	package _pSDL_QueueAudio _SDL_QueueAudio;
	extern(C) int SDL_QueueAudio(SDL_AudioDeviceID dev, const(void)* data, uint len){ return _SDL_QueueAudio(__traits(parameters)); }
	package _pSDL_ClearQueuedAudio _SDL_ClearQueuedAudio;
	extern(C) int SDL_ClearQueuedAudio(SDL_AudioDeviceID dev){ return _SDL_ClearQueuedAudio(__traits(parameters)); }
	package _pSDL_GetQueuedAudioSize _SDL_GetQueuedAudioSize;
	extern(C) int SDL_GetQueuedAudioSize(SDL_AudioDeviceID dev){ return _SDL_GetQueuedAudioSize(__traits(parameters)); }
	package _pSDL_DequeueAudio _SDL_DequeueAudio;
	extern(C) uint SDL_DequeueAudio(SDL_AudioDeviceID dev, void* data, uint len){ return _SDL_DequeueAudio(__traits(parameters)); }
	package _pSDL_NewAudioStream _SDL_NewAudioStream;
	extern(C) SDL_AudioStream* SDL_NewAudioStream(const SDL_AudioFormat srcFormat, const ubyte srcChannels, const int srcRate, const SDL_AudioFormat dstFormat, const ubyte dstChannels, const int dstRate){ return _SDL_NewAudioStream(__traits(parameters)); }
	package _pSDL_AudioStreamPut _SDL_AudioStreamPut;
	extern(C) int SDL_AudioStreamPut(SDL_AudioStream* stream, const(void)* buf, int len){ return _SDL_AudioStreamPut(__traits(parameters)); }
	package _pSDL_AudioStreamGet _SDL_AudioStreamGet;
	extern(C) int SDL_AudioStreamGet(SDL_AudioStream* stream, void* buf, int len){ return _SDL_AudioStreamGet(__traits(parameters)); }
	package _pSDL_AudioStreamAvailable _SDL_AudioStreamAvailable;
	extern(C) int SDL_AudioStreamAvailable(SDL_AudioStream* stream){ return _SDL_AudioStreamAvailable(__traits(parameters)); }
	package _pSDL_AudioStreamFlush _SDL_AudioStreamFlush;
	extern(C) int SDL_AudioStreamFlush(SDL_AudioStream* stream){ return _SDL_AudioStreamFlush(__traits(parameters)); }
	package _pSDL_AudioStreamClear _SDL_AudioStreamClear;
	extern(C) void SDL_AudioStreamClear(SDL_AudioStream* stream){ _SDL_AudioStreamClear(__traits(parameters)); }
	package _pSDL_FreeAudioStream _SDL_FreeAudioStream;
	extern(C) void SDL_FreeAudioStream(SDL_AudioStream* stream){ _SDL_FreeAudioStream(__traits(parameters)); }
	package _pSDL_GetAudioDeviceSpec _SDL_GetAudioDeviceSpec;
	extern(C) int SDL_GetAudioDeviceSpec(int index, int isCapture, SDL_AudioSpec* spec){ return _SDL_GetAudioDeviceSpec(__traits(parameters)); }
	package _pSDL_GetDefaultAudioInfo _SDL_GetDefaultAudioInfo;
	extern(C) int SDL_GetDefaultAudioInfo(char** name, SDL_AudioSpec* spec, int isCapture){ return _SDL_GetDefaultAudioInfo(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetNumAudioDrivers, here.SDL_GetNumAudioDrivers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetAudioDriver, here.SDL_GetAudioDriver.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AudioInit, here.SDL_AudioInit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AudioQuit, here.SDL_AudioQuit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetCurrentAudioDriver, here.SDL_GetCurrentAudioDriver.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OpenAudio, here.SDL_OpenAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetNumAudioDevices, here.SDL_GetNumAudioDevices.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetAudioDeviceName, here.SDL_GetAudioDeviceName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OpenAudioDevice, here.SDL_OpenAudioDevice.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetAudioStatus, here.SDL_GetAudioStatus.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetAudioDeviceStatus, here.SDL_GetAudioDeviceStatus.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_PauseAudio, here.SDL_PauseAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_PauseAudioDevice, here.SDL_PauseAudioDevice.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LoadWAV_RW, here.SDL_LoadWAV_RW.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FreeWAV, here.SDL_FreeWAV.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_BuildAudioCVT, here.SDL_BuildAudioCVT.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ConvertAudio, here.SDL_ConvertAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MixAudio, here.SDL_MixAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MixAudioFormat, here.SDL_MixAudioFormat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockAudio, here.SDL_LockAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockAudioDevice, here.SDL_LockAudioDevice.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnlockAudio, here.SDL_UnlockAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnlockAudioDevice, here.SDL_UnlockAudioDevice.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CloseAudio, here.SDL_CloseAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CloseAudioDevice, here.SDL_CloseAudioDevice.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_QueueAudio, here.SDL_QueueAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ClearQueuedAudio, here.SDL_ClearQueuedAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetQueuedAudioSize, here.SDL_GetQueuedAudioSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DequeueAudio, here.SDL_DequeueAudio.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_NewAudioStream, here.SDL_NewAudioStream.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AudioStreamPut, here.SDL_AudioStreamPut.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AudioStreamGet, here.SDL_AudioStreamGet.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AudioStreamAvailable, here.SDL_AudioStreamAvailable.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AudioStreamFlush, here.SDL_AudioStreamFlush.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AudioStreamClear, here.SDL_AudioStreamClear.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FreeAudioStream, here.SDL_FreeAudioStream.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetAudioDeviceSpec, here.SDL_GetAudioDeviceSpec.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDefaultAudioInfo, here.SDL_GetDefaultAudioInfo.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/blendmode.d(59,1)
private nothrow @nogc{
	alias _pSDL_ComposeCustomBlendMode = extern(C) SDL_BlendMode function(SDL_BlendFactor srcColourFactor, SDL_BlendFactor dstColourFactor, SDL_BlendOperation colourOperation, SDL_BlendFactor srcAlphaFactor, SDL_BlendFactor dstAlphaFactor, SDL_BlendOperation alphaOperation);
}
__gshared nothrow @nogc{
	package _pSDL_ComposeCustomBlendMode _SDL_ComposeCustomBlendMode;
	extern(C) SDL_BlendMode SDL_ComposeCustomBlendMode(SDL_BlendFactor srcColourFactor, SDL_BlendFactor dstColourFactor, SDL_BlendOperation colourOperation, SDL_BlendFactor srcAlphaFactor, SDL_BlendFactor dstAlphaFactor, SDL_BlendOperation alphaOperation){ return _SDL_ComposeCustomBlendMode(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_ComposeCustomBlendMode, here.SDL_ComposeCustomBlendMode.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/clipboard.d(15,1)
private nothrow @nogc{
	alias _pSDL_SetClipboardText = extern(C) int function(const(char)* text);
	alias _pSDL_GetClipboardText = extern(C) char* function();
	alias _pSDL_HasClipboardText = extern(C) SDL_bool function();
	alias _pSDL_SetPrimarySelectionText = extern(C) int function(const(char)* text);
	alias _pSDL_GetPrimarySelectionText = extern(C) char* function();
	alias _pSDL_HasPrimarySelectionText = extern(C) SDL_bool function();
}
__gshared nothrow @nogc{
	package _pSDL_SetClipboardText _SDL_SetClipboardText;
	extern(C) int SDL_SetClipboardText(const(char)* text){ return _SDL_SetClipboardText(__traits(parameters)); }
	package _pSDL_GetClipboardText _SDL_GetClipboardText;
	extern(C) char* SDL_GetClipboardText(){ return _SDL_GetClipboardText(__traits(parameters)); }
	package _pSDL_HasClipboardText _SDL_HasClipboardText;
	extern(C) SDL_bool SDL_HasClipboardText(){ return _SDL_HasClipboardText(__traits(parameters)); }
	package _pSDL_SetPrimarySelectionText _SDL_SetPrimarySelectionText;
	extern(C) int SDL_SetPrimarySelectionText(const(char)* text){ return _SDL_SetPrimarySelectionText(__traits(parameters)); }
	package _pSDL_GetPrimarySelectionText _SDL_GetPrimarySelectionText;
	extern(C) char* SDL_GetPrimarySelectionText(){ return _SDL_GetPrimarySelectionText(__traits(parameters)); }
	package _pSDL_HasPrimarySelectionText _SDL_HasPrimarySelectionText;
	extern(C) SDL_bool SDL_HasPrimarySelectionText(){ return _SDL_HasPrimarySelectionText(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_SetClipboardText, here.SDL_SetClipboardText.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetClipboardText, here.SDL_GetClipboardText.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasClipboardText, here.SDL_HasClipboardText.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetPrimarySelectionText, here.SDL_SetPrimarySelectionText.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetPrimarySelectionText, here.SDL_GetPrimarySelectionText.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasPrimarySelectionText, here.SDL_HasPrimarySelectionText.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/cpuinfo.d(17,1)
private nothrow @nogc{
	alias _pSDL_GetCPUCount = extern(C) int function();
	alias _pSDL_GetCPUCacheLineSize = extern(C) int function();
	alias _pSDL_HasRDTSC = extern(C) SDL_bool function();
	alias _pSDL_HasAltiVec = extern(C) SDL_bool function();
	alias _pSDL_HasMMX = extern(C) SDL_bool function();
	alias _pSDL_Has3DNow = extern(C) SDL_bool function();
	alias _pSDL_HasSSE = extern(C) SDL_bool function();
	alias _pSDL_HasSSE2 = extern(C) SDL_bool function();
	alias _pSDL_HasSSE3 = extern(C) SDL_bool function();
	alias _pSDL_HasSSE41 = extern(C) SDL_bool function();
	alias _pSDL_HasSSE42 = extern(C) SDL_bool function();
	alias _pSDL_GetSystemRAM = extern(C) int function();
	alias _pSDL_HasAVX = extern(C) SDL_bool function();
	alias _pSDL_HasAVX2 = extern(C) SDL_bool function();
	alias _pSDL_HasNEON = extern(C) SDL_bool function();
	alias _pSDL_HasAVX512F = extern(C) SDL_bool function();
	alias _pSDL_SIMDGetAlignment = extern(C) size_t function();
	alias _pSDL_SIMDAlloc = extern(C) void* function(const(size_t) len);
	alias _pSDL_SIMDFree = extern(C) void function(void*);
	alias _pSDL_HasARMSIMD = extern(C) SDL_bool function();
	alias _pSDL_SIMDRealloc = extern(C) void* function(void* mem, const(size_t) len);
	alias _pSDL_HasLSX = extern(C) SDL_bool function();
	alias _pSDL_HasLASX = extern(C) SDL_bool function();
}
__gshared nothrow @nogc{
	package _pSDL_GetCPUCount _SDL_GetCPUCount;
	extern(C) int SDL_GetCPUCount(){ return _SDL_GetCPUCount(__traits(parameters)); }
	package _pSDL_GetCPUCacheLineSize _SDL_GetCPUCacheLineSize;
	extern(C) int SDL_GetCPUCacheLineSize(){ return _SDL_GetCPUCacheLineSize(__traits(parameters)); }
	package _pSDL_HasRDTSC _SDL_HasRDTSC;
	extern(C) SDL_bool SDL_HasRDTSC(){ return _SDL_HasRDTSC(__traits(parameters)); }
	package _pSDL_HasAltiVec _SDL_HasAltiVec;
	extern(C) SDL_bool SDL_HasAltiVec(){ return _SDL_HasAltiVec(__traits(parameters)); }
	package _pSDL_HasMMX _SDL_HasMMX;
	extern(C) SDL_bool SDL_HasMMX(){ return _SDL_HasMMX(__traits(parameters)); }
	package _pSDL_Has3DNow _SDL_Has3DNow;
	extern(C) SDL_bool SDL_Has3DNow(){ return _SDL_Has3DNow(__traits(parameters)); }
	package _pSDL_HasSSE _SDL_HasSSE;
	extern(C) SDL_bool SDL_HasSSE(){ return _SDL_HasSSE(__traits(parameters)); }
	package _pSDL_HasSSE2 _SDL_HasSSE2;
	extern(C) SDL_bool SDL_HasSSE2(){ return _SDL_HasSSE2(__traits(parameters)); }
	package _pSDL_HasSSE3 _SDL_HasSSE3;
	extern(C) SDL_bool SDL_HasSSE3(){ return _SDL_HasSSE3(__traits(parameters)); }
	package _pSDL_HasSSE41 _SDL_HasSSE41;
	extern(C) SDL_bool SDL_HasSSE41(){ return _SDL_HasSSE41(__traits(parameters)); }
	package _pSDL_HasSSE42 _SDL_HasSSE42;
	extern(C) SDL_bool SDL_HasSSE42(){ return _SDL_HasSSE42(__traits(parameters)); }
	package _pSDL_GetSystemRAM _SDL_GetSystemRAM;
	extern(C) int SDL_GetSystemRAM(){ return _SDL_GetSystemRAM(__traits(parameters)); }
	package _pSDL_HasAVX _SDL_HasAVX;
	extern(C) SDL_bool SDL_HasAVX(){ return _SDL_HasAVX(__traits(parameters)); }
	package _pSDL_HasAVX2 _SDL_HasAVX2;
	extern(C) SDL_bool SDL_HasAVX2(){ return _SDL_HasAVX2(__traits(parameters)); }
	package _pSDL_HasNEON _SDL_HasNEON;
	extern(C) SDL_bool SDL_HasNEON(){ return _SDL_HasNEON(__traits(parameters)); }
	package _pSDL_HasAVX512F _SDL_HasAVX512F;
	extern(C) SDL_bool SDL_HasAVX512F(){ return _SDL_HasAVX512F(__traits(parameters)); }
	package _pSDL_SIMDGetAlignment _SDL_SIMDGetAlignment;
	extern(C) size_t SDL_SIMDGetAlignment(){ return _SDL_SIMDGetAlignment(__traits(parameters)); }
	package _pSDL_SIMDAlloc _SDL_SIMDAlloc;
	extern(C) void* SDL_SIMDAlloc(const(size_t) len){ return _SDL_SIMDAlloc(__traits(parameters)); }
	package _pSDL_SIMDFree _SDL_SIMDFree;
	extern(C) void SDL_SIMDFree(void*){ _SDL_SIMDFree(__traits(parameters)); }
	package _pSDL_HasARMSIMD _SDL_HasARMSIMD;
	extern(C) SDL_bool SDL_HasARMSIMD(){ return _SDL_HasARMSIMD(__traits(parameters)); }
	package _pSDL_SIMDRealloc _SDL_SIMDRealloc;
	extern(C) void* SDL_SIMDRealloc(void* mem, const(size_t) len){ return _SDL_SIMDRealloc(__traits(parameters)); }
	package _pSDL_HasLSX _SDL_HasLSX;
	extern(C) SDL_bool SDL_HasLSX(){ return _SDL_HasLSX(__traits(parameters)); }
	package _pSDL_HasLASX _SDL_HasLASX;
	extern(C) SDL_bool SDL_HasLASX(){ return _SDL_HasLASX(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetCPUCount, here.SDL_GetCPUCount.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetCPUCacheLineSize, here.SDL_GetCPUCacheLineSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasRDTSC, here.SDL_HasRDTSC.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasAltiVec, here.SDL_HasAltiVec.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasMMX, here.SDL_HasMMX.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Has3DNow, here.SDL_Has3DNow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasSSE, here.SDL_HasSSE.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasSSE2, here.SDL_HasSSE2.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasSSE3, here.SDL_HasSSE3.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasSSE41, here.SDL_HasSSE41.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasSSE42, here.SDL_HasSSE42.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetSystemRAM, here.SDL_GetSystemRAM.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasAVX, here.SDL_HasAVX.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasAVX2, here.SDL_HasAVX2.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasNEON, here.SDL_HasNEON.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasAVX512F, here.SDL_HasAVX512F.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SIMDGetAlignment, here.SDL_SIMDGetAlignment.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SIMDAlloc, here.SDL_SIMDAlloc.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SIMDFree, here.SDL_SIMDFree.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasARMSIMD, here.SDL_HasARMSIMD.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SIMDRealloc, here.SDL_SIMDRealloc.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasLSX, here.SDL_HasLSX.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasLASX, here.SDL_HasLASX.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/error.d(29,1)
private nothrow @nogc{
	alias _pSDL_SetError = extern(C) void function(const(char)* fmt, ...);
	alias _pSDL_GetError = extern(C) const(char)* function();
	alias _pSDL_ClearError = extern(C) void function();
	alias _pSDL_Error = extern(C) int function(SDL_errorcode code);
	alias _pSDL_GetErrorMsg = extern(C) char* function(char* errStr, int maxLen);
}
__gshared nothrow @nogc{
	_pSDL_SetError SDL_SetError;
	package _pSDL_GetError _SDL_GetError;
	extern(C) const(char)* SDL_GetError(){ return _SDL_GetError(__traits(parameters)); }
	package _pSDL_ClearError _SDL_ClearError;
	extern(C) void SDL_ClearError(){ _SDL_ClearError(__traits(parameters)); }
	package _pSDL_Error _SDL_Error;
	extern(C) int SDL_Error(SDL_errorcode code){ return _SDL_Error(__traits(parameters)); }
	package _pSDL_GetErrorMsg _SDL_GetErrorMsg;
	extern(C) char* SDL_GetErrorMsg(char* errStr, int maxLen){ return _SDL_GetErrorMsg(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&SDL_SetError, "SDL_SetError");
	lib.bindSymbol(cast(void**)&_SDL_GetError, here.SDL_GetError.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ClearError, here.SDL_ClearError.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Error, here.SDL_Error.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetErrorMsg, here.SDL_GetErrorMsg.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/touch.d(37,1)
private nothrow @nogc{
	alias _pSDL_GetNumTouchDevices = extern(C) int function();
	alias _pSDL_GetTouchDevice = extern(C) SDL_TouchID function(int index);
	alias _pSDL_GetNumTouchFingers = extern(C) int function(SDL_TouchID touchID);
	alias _pSDL_GetTouchFinger = extern(C) SDL_Finger* function(SDL_TouchID touchID, int index);
	alias _pSDL_GetTouchDeviceType = extern(C) SDL_TouchDeviceType function(SDL_TouchID touchID);
	alias _pSDL_GetTouchName = extern(C) const(char)* function(int index);
}
__gshared nothrow @nogc{
	package _pSDL_GetNumTouchDevices _SDL_GetNumTouchDevices;
	extern(C) int SDL_GetNumTouchDevices(){ return _SDL_GetNumTouchDevices(__traits(parameters)); }
	package _pSDL_GetTouchDevice _SDL_GetTouchDevice;
	extern(C) SDL_TouchID SDL_GetTouchDevice(int index){ return _SDL_GetTouchDevice(__traits(parameters)); }
	package _pSDL_GetNumTouchFingers _SDL_GetNumTouchFingers;
	extern(C) int SDL_GetNumTouchFingers(SDL_TouchID touchID){ return _SDL_GetNumTouchFingers(__traits(parameters)); }
	package _pSDL_GetTouchFinger _SDL_GetTouchFinger;
	extern(C) SDL_Finger* SDL_GetTouchFinger(SDL_TouchID touchID, int index){ return _SDL_GetTouchFinger(__traits(parameters)); }
	package _pSDL_GetTouchDeviceType _SDL_GetTouchDeviceType;
	extern(C) SDL_TouchDeviceType SDL_GetTouchDeviceType(SDL_TouchID touchID){ return _SDL_GetTouchDeviceType(__traits(parameters)); }
	package _pSDL_GetTouchName _SDL_GetTouchName;
	extern(C) const(char)* SDL_GetTouchName(int index){ return _SDL_GetTouchName(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetNumTouchDevices, here.SDL_GetNumTouchDevices.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTouchDevice, here.SDL_GetTouchDevice.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetNumTouchFingers, here.SDL_GetNumTouchFingers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTouchFinger, here.SDL_GetTouchFinger.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTouchDeviceType, here.SDL_GetTouchDeviceType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTouchName, here.SDL_GetTouchName.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/gesture.d(18,1)
private nothrow @nogc{
	alias _pSDL_RecordGesture = extern(C) int function(SDL_TouchID touchID);
	alias _pSDL_SaveAllDollarTemplates = extern(C) int function(SDL_RWops* dst);
	alias _pSDL_SaveDollarTemplate = extern(C) int function(SDL_GestureID gestureID, SDL_RWops* dst);
	alias _pSDL_LoadDollarTemplates = extern(C) int function(SDL_TouchID touchID, SDL_RWops* src);
}
__gshared nothrow @nogc{
	package _pSDL_RecordGesture _SDL_RecordGesture;
	extern(C) int SDL_RecordGesture(SDL_TouchID touchID){ return _SDL_RecordGesture(__traits(parameters)); }
	package _pSDL_SaveAllDollarTemplates _SDL_SaveAllDollarTemplates;
	extern(C) int SDL_SaveAllDollarTemplates(SDL_RWops* dst){ return _SDL_SaveAllDollarTemplates(__traits(parameters)); }
	package _pSDL_SaveDollarTemplate _SDL_SaveDollarTemplate;
	extern(C) int SDL_SaveDollarTemplate(SDL_GestureID gestureID, SDL_RWops* dst){ return _SDL_SaveDollarTemplate(__traits(parameters)); }
	package _pSDL_LoadDollarTemplates _SDL_LoadDollarTemplates;
	extern(C) int SDL_LoadDollarTemplates(SDL_TouchID touchID, SDL_RWops* src){ return _SDL_LoadDollarTemplates(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_RecordGesture, here.SDL_RecordGesture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SaveAllDollarTemplates, here.SDL_SaveAllDollarTemplates.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SaveDollarTemplate, here.SDL_SaveDollarTemplate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LoadDollarTemplates, here.SDL_LoadDollarTemplates.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/guid.d(16,1)
private nothrow @nogc{
	alias _pSDL_GUIDToString = extern(C) void function(SDL_GUID guid, char* pszGUID, int cbGUID);
	alias _pSDL_GUIDFromString = extern(C) SDL_GUID function(const(char)* pchGUID);
}
__gshared nothrow @nogc{
	package _pSDL_GUIDToString _SDL_GUIDToString;
	extern(C) void SDL_GUIDToString(SDL_GUID guid, char* pszGUID, int cbGUID){ _SDL_GUIDToString(__traits(parameters)); }
	package _pSDL_GUIDFromString _SDL_GUIDFromString;
	extern(C) SDL_GUID SDL_GUIDFromString(const(char)* pchGUID){ return _SDL_GUIDFromString(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GUIDToString, here.SDL_GUIDToString.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GUIDFromString, here.SDL_GUIDFromString.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/joystick.d(103,1)
private nothrow @nogc{
	alias _pSDL_NumJoysticks = extern(C) int function();
	alias _pSDL_JoystickNameForIndex = extern(C) const(char)* function(int deviceIndex);
	alias _pSDL_JoystickGetDeviceGUID = extern(C) SDL_JoystickGUID function(int deviceIndex);
	alias _pSDL_JoystickOpen = extern(C) SDL_Joystick* function(int device_index);
	alias _pSDL_JoystickName = extern(C) const(char)* function(SDL_Joystick* joystick);
	alias _pSDL_JoystickGetGUID = extern(C) SDL_JoystickGUID function(SDL_Joystick* joystick);
	alias _pSDL_JoystickGetGUIDString = extern(C) void function(SDL_JoystickGUID guid, char* pszGUID, int cbGUID);
	alias _pSDL_JoystickGetGUIDFromString = extern(C) SDL_JoystickGUID function(const(char)*);
	alias _pSDL_JoystickGetAttached = extern(C) SDL_bool function(SDL_Joystick* joystick);
	alias _pSDL_JoystickInstanceID = extern(C) SDL_JoystickID function(SDL_Joystick* joystick);
	alias _pSDL_JoystickNumAxes = extern(C) int function(SDL_Joystick* joystick);
	alias _pSDL_JoystickNumBalls = extern(C) int function(SDL_Joystick* joystick);
	alias _pSDL_JoystickNumHats = extern(C) int function(SDL_Joystick* joystick);
	alias _pSDL_JoystickNumButtons = extern(C) int function(SDL_Joystick* joystick);
	alias _pSDL_JoystickUpdate = extern(C) void function();
	alias _pSDL_JoystickEventState = extern(C) int function(int state);
	alias _pSDL_JoystickGetAxis = extern(C) short function(SDL_Joystick* joystick, int axis);
	alias _pSDL_JoystickGetHat = extern(C) ubyte function(SDL_Joystick* joystick, int hat);
	alias _pSDL_JoystickGetBall = extern(C) int function(SDL_Joystick* joystick, int ball, int* dx, int* dy);
	alias _pSDL_JoystickGetButton = extern(C) ubyte function(SDL_Joystick* joystick, int button);
	alias _pSDL_JoystickClose = extern(C) void function(SDL_Joystick* joystick);
	alias _pSDL_JoystickCurrentPowerLevel = extern(C) SDL_JoystickPowerLevel function(SDL_Joystick* joystick);
	alias _pSDL_JoystickFromInstanceID = extern(C) SDL_Joystick* function(SDL_JoystickID instanceID);
	alias _pSDL_JoystickGetAxisInitialState = extern(C) SDL_bool function(SDL_Joystick* joystick, int axis, short* state);
	alias _pSDL_JoystickGetDeviceProduct = extern(C) ushort function(int deviceIndex);
	alias _pSDL_JoystickGetDeviceProductVersion = extern(C) ushort function(int deviceIndex);
	alias _pSDL_JoystickGetDeviceType = extern(C) SDL_JoystickType function(int deviceIndex);
	alias _pSDL_JoystickGetDeviceInstanceID = extern(C) SDL_JoystickType function(int deviceIndex);
	alias _pSDL_JoystickGetDeviceVendor = extern(C) ushort function(int device_index);
	alias _pSDL_JoystickGetProduct = extern(C) ushort function(SDL_Joystick* joystick);
	alias _pSDL_JoystickGetProductVersion = extern(C) ushort function(SDL_Joystick* joystick);
	alias _pSDL_JoystickGetType = extern(C) SDL_JoystickType function(SDL_Joystick* joystick);
	alias _pSDL_JoystickGetVendor = extern(C) ushort function(SDL_Joystick* joystick);
	alias _pSDL_LockJoysticks = extern(C) void function();
	alias _pSDL_UnlockJoysticks = extern(C) void function();
	alias _pSDL_JoystickRumble = extern(C) int function(SDL_Joystick* joystick, ushort lowFrequencyRumble, ushort highFrequencyRumble, uint durationMS);
	alias _pSDL_JoystickGetDevicePlayerIndex = extern(C) int function(int deviceIndex);
	alias _pSDL_JoystickGetPlayerIndex = extern(C) int function(SDL_Joystick* joystick);
	alias _pSDL_JoystickFromPlayerIndex = extern(C) SDL_Joystick* function(int);
	alias _pSDL_JoystickSetPlayerIndex = extern(C) void function(SDL_Joystick* joystick, int);
	alias _pSDL_JoystickAttachVirtual = extern(C) int function(SDL_JoystickType type, int naxes, int nButtons, int nHats);
	alias _pSDL_JoystickDetachVirtual = extern(C) int function(int deviceIndex);
	alias _pSDL_JoystickIsVirtual = extern(C) SDL_bool function(int deviceIndex);
	alias _pSDL_JoystickSetVirtualAxis = extern(C) int function(SDL_Joystick* joystick, int axis, short value);
	alias _pSDL_JoystickSetVirtualButton = extern(C) int function(SDL_Joystick* joystick, int button, ubyte value);
	alias _pSDL_JoystickSetVirtualHat = extern(C) int function(SDL_Joystick* joystick, int hat, ubyte value);
	alias _pSDL_JoystickGetSerial = extern(C) const(char)* function(SDL_Joystick* joystick);
	alias _pSDL_JoystickRumbleTriggers = extern(C) int function(SDL_Joystick* joystick, ushort leftRumble, ushort rightRumble, uint durationMS);
	alias _pSDL_JoystickHasLED = extern(C) SDL_bool function(SDL_Joystick* joystick);
	alias _pSDL_JoystickSetLED = extern(C) int function(SDL_Joystick* joystick, ubyte red, ubyte green, ubyte blue);
	alias _pSDL_JoystickSendEffect = extern(C) int function(SDL_Joystick* joystick, const(void)* data, int size);
	alias _pSDL_JoystickHasRumble = extern(C) SDL_bool function(SDL_Joystick* joystick);
	alias _pSDL_JoystickHasRumbleTriggers = extern(C) SDL_bool function(SDL_Joystick* joystick);
	alias _pSDL_JoystickPathForIndex = extern(C) const(char)* function(int deviceIndex);
	alias _pSDL_JoystickAttachVirtualEx = extern(C) int function(const(SDL_VirtualJoystickDesc)* desc);
	alias _pSDL_JoystickPath = extern(C) const(char)* function(SDL_Joystick* joystick);
	alias _pSDL_JoystickGetFirmwareVersion = extern(C) ushort function(SDL_Joystick* joystick);
	alias _pSDL_GetJoystickGUIDInfo = extern(C) void function(SDL_JoystickGUID guid, ushort* vendor, ushort* product, ushort* version_, ushort* crc16);
}
__gshared nothrow @nogc{
	package _pSDL_NumJoysticks _SDL_NumJoysticks;
	extern(C) int SDL_NumJoysticks(){ return _SDL_NumJoysticks(__traits(parameters)); }
	package _pSDL_JoystickNameForIndex _SDL_JoystickNameForIndex;
	extern(C) const(char)* SDL_JoystickNameForIndex(int deviceIndex){ return _SDL_JoystickNameForIndex(__traits(parameters)); }
	package _pSDL_JoystickGetDeviceGUID _SDL_JoystickGetDeviceGUID;
	extern(C) SDL_JoystickGUID SDL_JoystickGetDeviceGUID(int deviceIndex){ return _SDL_JoystickGetDeviceGUID(__traits(parameters)); }
	package _pSDL_JoystickOpen _SDL_JoystickOpen;
	extern(C) SDL_Joystick* SDL_JoystickOpen(int device_index){ return _SDL_JoystickOpen(__traits(parameters)); }
	package _pSDL_JoystickName _SDL_JoystickName;
	extern(C) const(char)* SDL_JoystickName(SDL_Joystick* joystick){ return _SDL_JoystickName(__traits(parameters)); }
	package _pSDL_JoystickGetGUID _SDL_JoystickGetGUID;
	extern(C) SDL_JoystickGUID SDL_JoystickGetGUID(SDL_Joystick* joystick){ return _SDL_JoystickGetGUID(__traits(parameters)); }
	package _pSDL_JoystickGetGUIDString _SDL_JoystickGetGUIDString;
	extern(C) void SDL_JoystickGetGUIDString(SDL_JoystickGUID guid, char* pszGUID, int cbGUID){ _SDL_JoystickGetGUIDString(__traits(parameters)); }
	package _pSDL_JoystickGetGUIDFromString _SDL_JoystickGetGUIDFromString;
	extern(C) SDL_JoystickGUID SDL_JoystickGetGUIDFromString(const(char)*){ return _SDL_JoystickGetGUIDFromString(__traits(parameters)); }
	package _pSDL_JoystickGetAttached _SDL_JoystickGetAttached;
	extern(C) SDL_bool SDL_JoystickGetAttached(SDL_Joystick* joystick){ return _SDL_JoystickGetAttached(__traits(parameters)); }
	package _pSDL_JoystickInstanceID _SDL_JoystickInstanceID;
	extern(C) SDL_JoystickID SDL_JoystickInstanceID(SDL_Joystick* joystick){ return _SDL_JoystickInstanceID(__traits(parameters)); }
	package _pSDL_JoystickNumAxes _SDL_JoystickNumAxes;
	extern(C) int SDL_JoystickNumAxes(SDL_Joystick* joystick){ return _SDL_JoystickNumAxes(__traits(parameters)); }
	package _pSDL_JoystickNumBalls _SDL_JoystickNumBalls;
	extern(C) int SDL_JoystickNumBalls(SDL_Joystick* joystick){ return _SDL_JoystickNumBalls(__traits(parameters)); }
	package _pSDL_JoystickNumHats _SDL_JoystickNumHats;
	extern(C) int SDL_JoystickNumHats(SDL_Joystick* joystick){ return _SDL_JoystickNumHats(__traits(parameters)); }
	package _pSDL_JoystickNumButtons _SDL_JoystickNumButtons;
	extern(C) int SDL_JoystickNumButtons(SDL_Joystick* joystick){ return _SDL_JoystickNumButtons(__traits(parameters)); }
	package _pSDL_JoystickUpdate _SDL_JoystickUpdate;
	extern(C) void SDL_JoystickUpdate(){ _SDL_JoystickUpdate(__traits(parameters)); }
	package _pSDL_JoystickEventState _SDL_JoystickEventState;
	extern(C) int SDL_JoystickEventState(int state){ return _SDL_JoystickEventState(__traits(parameters)); }
	package _pSDL_JoystickGetAxis _SDL_JoystickGetAxis;
	extern(C) short SDL_JoystickGetAxis(SDL_Joystick* joystick, int axis){ return _SDL_JoystickGetAxis(__traits(parameters)); }
	package _pSDL_JoystickGetHat _SDL_JoystickGetHat;
	extern(C) ubyte SDL_JoystickGetHat(SDL_Joystick* joystick, int hat){ return _SDL_JoystickGetHat(__traits(parameters)); }
	package _pSDL_JoystickGetBall _SDL_JoystickGetBall;
	extern(C) int SDL_JoystickGetBall(SDL_Joystick* joystick, int ball, int* dx, int* dy){ return _SDL_JoystickGetBall(__traits(parameters)); }
	package _pSDL_JoystickGetButton _SDL_JoystickGetButton;
	extern(C) ubyte SDL_JoystickGetButton(SDL_Joystick* joystick, int button){ return _SDL_JoystickGetButton(__traits(parameters)); }
	package _pSDL_JoystickClose _SDL_JoystickClose;
	extern(C) void SDL_JoystickClose(SDL_Joystick* joystick){ _SDL_JoystickClose(__traits(parameters)); }
	package _pSDL_JoystickCurrentPowerLevel _SDL_JoystickCurrentPowerLevel;
	extern(C) SDL_JoystickPowerLevel SDL_JoystickCurrentPowerLevel(SDL_Joystick* joystick){ return _SDL_JoystickCurrentPowerLevel(__traits(parameters)); }
	package _pSDL_JoystickFromInstanceID _SDL_JoystickFromInstanceID;
	extern(C) SDL_Joystick* SDL_JoystickFromInstanceID(SDL_JoystickID instanceID){ return _SDL_JoystickFromInstanceID(__traits(parameters)); }
	package _pSDL_JoystickGetAxisInitialState _SDL_JoystickGetAxisInitialState;
	extern(C) SDL_bool SDL_JoystickGetAxisInitialState(SDL_Joystick* joystick, int axis, short* state){ return _SDL_JoystickGetAxisInitialState(__traits(parameters)); }
	package _pSDL_JoystickGetDeviceProduct _SDL_JoystickGetDeviceProduct;
	extern(C) ushort SDL_JoystickGetDeviceProduct(int deviceIndex){ return _SDL_JoystickGetDeviceProduct(__traits(parameters)); }
	package _pSDL_JoystickGetDeviceProductVersion _SDL_JoystickGetDeviceProductVersion;
	extern(C) ushort SDL_JoystickGetDeviceProductVersion(int deviceIndex){ return _SDL_JoystickGetDeviceProductVersion(__traits(parameters)); }
	package _pSDL_JoystickGetDeviceType _SDL_JoystickGetDeviceType;
	extern(C) SDL_JoystickType SDL_JoystickGetDeviceType(int deviceIndex){ return _SDL_JoystickGetDeviceType(__traits(parameters)); }
	package _pSDL_JoystickGetDeviceInstanceID _SDL_JoystickGetDeviceInstanceID;
	extern(C) SDL_JoystickType SDL_JoystickGetDeviceInstanceID(int deviceIndex){ return _SDL_JoystickGetDeviceInstanceID(__traits(parameters)); }
	package _pSDL_JoystickGetDeviceVendor _SDL_JoystickGetDeviceVendor;
	extern(C) ushort SDL_JoystickGetDeviceVendor(int device_index){ return _SDL_JoystickGetDeviceVendor(__traits(parameters)); }
	package _pSDL_JoystickGetProduct _SDL_JoystickGetProduct;
	extern(C) ushort SDL_JoystickGetProduct(SDL_Joystick* joystick){ return _SDL_JoystickGetProduct(__traits(parameters)); }
	package _pSDL_JoystickGetProductVersion _SDL_JoystickGetProductVersion;
	extern(C) ushort SDL_JoystickGetProductVersion(SDL_Joystick* joystick){ return _SDL_JoystickGetProductVersion(__traits(parameters)); }
	package _pSDL_JoystickGetType _SDL_JoystickGetType;
	extern(C) SDL_JoystickType SDL_JoystickGetType(SDL_Joystick* joystick){ return _SDL_JoystickGetType(__traits(parameters)); }
	package _pSDL_JoystickGetVendor _SDL_JoystickGetVendor;
	extern(C) ushort SDL_JoystickGetVendor(SDL_Joystick* joystick){ return _SDL_JoystickGetVendor(__traits(parameters)); }
	package _pSDL_LockJoysticks _SDL_LockJoysticks;
	extern(C) void SDL_LockJoysticks(){ _SDL_LockJoysticks(__traits(parameters)); }
	package _pSDL_UnlockJoysticks _SDL_UnlockJoysticks;
	extern(C) void SDL_UnlockJoysticks(){ _SDL_UnlockJoysticks(__traits(parameters)); }
	package _pSDL_JoystickRumble _SDL_JoystickRumble;
	extern(C) int SDL_JoystickRumble(SDL_Joystick* joystick, ushort lowFrequencyRumble, ushort highFrequencyRumble, uint durationMS){ return _SDL_JoystickRumble(__traits(parameters)); }
	package _pSDL_JoystickGetDevicePlayerIndex _SDL_JoystickGetDevicePlayerIndex;
	extern(C) int SDL_JoystickGetDevicePlayerIndex(int deviceIndex){ return _SDL_JoystickGetDevicePlayerIndex(__traits(parameters)); }
	package _pSDL_JoystickGetPlayerIndex _SDL_JoystickGetPlayerIndex;
	extern(C) int SDL_JoystickGetPlayerIndex(SDL_Joystick* joystick){ return _SDL_JoystickGetPlayerIndex(__traits(parameters)); }
	package _pSDL_JoystickFromPlayerIndex _SDL_JoystickFromPlayerIndex;
	extern(C) SDL_Joystick* SDL_JoystickFromPlayerIndex(int){ return _SDL_JoystickFromPlayerIndex(__traits(parameters)); }
	package _pSDL_JoystickSetPlayerIndex _SDL_JoystickSetPlayerIndex;
	extern(C) void SDL_JoystickSetPlayerIndex(SDL_Joystick* joystick, int){ _SDL_JoystickSetPlayerIndex(__traits(parameters)); }
	package _pSDL_JoystickAttachVirtual _SDL_JoystickAttachVirtual;
	extern(C) int SDL_JoystickAttachVirtual(SDL_JoystickType type, int naxes, int nButtons, int nHats){ return _SDL_JoystickAttachVirtual(__traits(parameters)); }
	package _pSDL_JoystickDetachVirtual _SDL_JoystickDetachVirtual;
	extern(C) int SDL_JoystickDetachVirtual(int deviceIndex){ return _SDL_JoystickDetachVirtual(__traits(parameters)); }
	package _pSDL_JoystickIsVirtual _SDL_JoystickIsVirtual;
	extern(C) SDL_bool SDL_JoystickIsVirtual(int deviceIndex){ return _SDL_JoystickIsVirtual(__traits(parameters)); }
	package _pSDL_JoystickSetVirtualAxis _SDL_JoystickSetVirtualAxis;
	extern(C) int SDL_JoystickSetVirtualAxis(SDL_Joystick* joystick, int axis, short value){ return _SDL_JoystickSetVirtualAxis(__traits(parameters)); }
	package _pSDL_JoystickSetVirtualButton _SDL_JoystickSetVirtualButton;
	extern(C) int SDL_JoystickSetVirtualButton(SDL_Joystick* joystick, int button, ubyte value){ return _SDL_JoystickSetVirtualButton(__traits(parameters)); }
	package _pSDL_JoystickSetVirtualHat _SDL_JoystickSetVirtualHat;
	extern(C) int SDL_JoystickSetVirtualHat(SDL_Joystick* joystick, int hat, ubyte value){ return _SDL_JoystickSetVirtualHat(__traits(parameters)); }
	package _pSDL_JoystickGetSerial _SDL_JoystickGetSerial;
	extern(C) const(char)* SDL_JoystickGetSerial(SDL_Joystick* joystick){ return _SDL_JoystickGetSerial(__traits(parameters)); }
	package _pSDL_JoystickRumbleTriggers _SDL_JoystickRumbleTriggers;
	extern(C) int SDL_JoystickRumbleTriggers(SDL_Joystick* joystick, ushort leftRumble, ushort rightRumble, uint durationMS){ return _SDL_JoystickRumbleTriggers(__traits(parameters)); }
	package _pSDL_JoystickHasLED _SDL_JoystickHasLED;
	extern(C) SDL_bool SDL_JoystickHasLED(SDL_Joystick* joystick){ return _SDL_JoystickHasLED(__traits(parameters)); }
	package _pSDL_JoystickSetLED _SDL_JoystickSetLED;
	extern(C) int SDL_JoystickSetLED(SDL_Joystick* joystick, ubyte red, ubyte green, ubyte blue){ return _SDL_JoystickSetLED(__traits(parameters)); }
	package _pSDL_JoystickSendEffect _SDL_JoystickSendEffect;
	extern(C) int SDL_JoystickSendEffect(SDL_Joystick* joystick, const(void)* data, int size){ return _SDL_JoystickSendEffect(__traits(parameters)); }
	package _pSDL_JoystickHasRumble _SDL_JoystickHasRumble;
	extern(C) SDL_bool SDL_JoystickHasRumble(SDL_Joystick* joystick){ return _SDL_JoystickHasRumble(__traits(parameters)); }
	package _pSDL_JoystickHasRumbleTriggers _SDL_JoystickHasRumbleTriggers;
	extern(C) SDL_bool SDL_JoystickHasRumbleTriggers(SDL_Joystick* joystick){ return _SDL_JoystickHasRumbleTriggers(__traits(parameters)); }
	package _pSDL_JoystickPathForIndex _SDL_JoystickPathForIndex;
	extern(C) const(char)* SDL_JoystickPathForIndex(int deviceIndex){ return _SDL_JoystickPathForIndex(__traits(parameters)); }
	package _pSDL_JoystickAttachVirtualEx _SDL_JoystickAttachVirtualEx;
	extern(C) int SDL_JoystickAttachVirtualEx(const(SDL_VirtualJoystickDesc)* desc){ return _SDL_JoystickAttachVirtualEx(__traits(parameters)); }
	package _pSDL_JoystickPath _SDL_JoystickPath;
	extern(C) const(char)* SDL_JoystickPath(SDL_Joystick* joystick){ return _SDL_JoystickPath(__traits(parameters)); }
	package _pSDL_JoystickGetFirmwareVersion _SDL_JoystickGetFirmwareVersion;
	extern(C) ushort SDL_JoystickGetFirmwareVersion(SDL_Joystick* joystick){ return _SDL_JoystickGetFirmwareVersion(__traits(parameters)); }
	package _pSDL_GetJoystickGUIDInfo _SDL_GetJoystickGUIDInfo;
	extern(C) void SDL_GetJoystickGUIDInfo(SDL_JoystickGUID guid, ushort* vendor, ushort* product, ushort* version_, ushort* crc16){ _SDL_GetJoystickGUIDInfo(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_NumJoysticks, here.SDL_NumJoysticks.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickNameForIndex, here.SDL_JoystickNameForIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetDeviceGUID, here.SDL_JoystickGetDeviceGUID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickOpen, here.SDL_JoystickOpen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickName, here.SDL_JoystickName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetGUID, here.SDL_JoystickGetGUID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetGUIDString, here.SDL_JoystickGetGUIDString.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetGUIDFromString, here.SDL_JoystickGetGUIDFromString.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetAttached, here.SDL_JoystickGetAttached.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickInstanceID, here.SDL_JoystickInstanceID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickNumAxes, here.SDL_JoystickNumAxes.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickNumBalls, here.SDL_JoystickNumBalls.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickNumHats, here.SDL_JoystickNumHats.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickNumButtons, here.SDL_JoystickNumButtons.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickUpdate, here.SDL_JoystickUpdate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickEventState, here.SDL_JoystickEventState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetAxis, here.SDL_JoystickGetAxis.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetHat, here.SDL_JoystickGetHat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetBall, here.SDL_JoystickGetBall.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetButton, here.SDL_JoystickGetButton.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickClose, here.SDL_JoystickClose.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickCurrentPowerLevel, here.SDL_JoystickCurrentPowerLevel.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickFromInstanceID, here.SDL_JoystickFromInstanceID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetAxisInitialState, here.SDL_JoystickGetAxisInitialState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetDeviceProduct, here.SDL_JoystickGetDeviceProduct.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetDeviceProductVersion, here.SDL_JoystickGetDeviceProductVersion.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetDeviceType, here.SDL_JoystickGetDeviceType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetDeviceInstanceID, here.SDL_JoystickGetDeviceInstanceID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetDeviceVendor, here.SDL_JoystickGetDeviceVendor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetProduct, here.SDL_JoystickGetProduct.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetProductVersion, here.SDL_JoystickGetProductVersion.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetType, here.SDL_JoystickGetType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetVendor, here.SDL_JoystickGetVendor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockJoysticks, here.SDL_LockJoysticks.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnlockJoysticks, here.SDL_UnlockJoysticks.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickRumble, here.SDL_JoystickRumble.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetDevicePlayerIndex, here.SDL_JoystickGetDevicePlayerIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetPlayerIndex, here.SDL_JoystickGetPlayerIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickFromPlayerIndex, here.SDL_JoystickFromPlayerIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickSetPlayerIndex, here.SDL_JoystickSetPlayerIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickAttachVirtual, here.SDL_JoystickAttachVirtual.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickDetachVirtual, here.SDL_JoystickDetachVirtual.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickIsVirtual, here.SDL_JoystickIsVirtual.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickSetVirtualAxis, here.SDL_JoystickSetVirtualAxis.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickSetVirtualButton, here.SDL_JoystickSetVirtualButton.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickSetVirtualHat, here.SDL_JoystickSetVirtualHat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetSerial, here.SDL_JoystickGetSerial.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickRumbleTriggers, here.SDL_JoystickRumbleTriggers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickHasLED, here.SDL_JoystickHasLED.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickSetLED, here.SDL_JoystickSetLED.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickSendEffect, here.SDL_JoystickSendEffect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickHasRumble, here.SDL_JoystickHasRumble.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickHasRumbleTriggers, here.SDL_JoystickHasRumbleTriggers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickPathForIndex, here.SDL_JoystickPathForIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickAttachVirtualEx, here.SDL_JoystickAttachVirtualEx.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickPath, here.SDL_JoystickPath.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickGetFirmwareVersion, here.SDL_JoystickGetFirmwareVersion.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetJoystickGUIDInfo, here.SDL_GetJoystickGUIDInfo.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/rect.d(74,1)
private nothrow @nogc{
	alias _pSDL_HasIntersection = extern(C) SDL_bool function(const(SDL_Rect)* a, const(SDL_Rect)* b);
	alias _pSDL_IntersectRect = extern(C) SDL_bool function(const(SDL_Rect)* a, const(SDL_Rect)* b,SDL_Rect* result);
	alias _pSDL_UnionRect = extern(C) void function(const(SDL_Rect)* a, const(SDL_Rect)* b, SDL_Rect* result);
	alias _pSDL_EnclosePoints = extern(C) SDL_bool function(const(SDL_Point)* points, int count, const(SDL_Rect)* clip, SDL_Rect* result);
	alias _pSDL_IntersectRectAndLine = extern(C) SDL_bool function(const(SDL_Rect)* rect, int* x1, int* y1, int* x2, int* y2);
	alias _pSDL_HasIntersectionF = extern(C) SDL_bool function(const(SDL_FRect)* a, const(SDL_FRect)* b);
	alias _pSDL_IntersectFRect = extern(C) SDL_bool function(const(SDL_FRect)* a, const(SDL_FRect)* b, SDL_FRect* result);
	alias _pSDL_UnionFRect = extern(C) SDL_bool function(const(SDL_FRect)* a, const(SDL_FRect)* b, SDL_FRect* result);
	alias _pSDL_EncloseFPoints = extern(C) SDL_bool function(const(SDL_FPoint)* points, int count, const(SDL_FRect)* clip, SDL_FRect* result);
	alias _pSDL_IntersectFRectAndLine = extern(C) SDL_bool function(const(SDL_FRect)* rect, float* x1, float* y1, float* x2, float* y2);
}
__gshared nothrow @nogc{
	package _pSDL_HasIntersection _SDL_HasIntersection;
	extern(C) SDL_bool SDL_HasIntersection(const(SDL_Rect)* a, const(SDL_Rect)* b){ return _SDL_HasIntersection(__traits(parameters)); }
	package _pSDL_IntersectRect _SDL_IntersectRect;
	extern(C) SDL_bool SDL_IntersectRect(const(SDL_Rect)* a, const(SDL_Rect)* b,SDL_Rect* result){ return _SDL_IntersectRect(__traits(parameters)); }
	package _pSDL_UnionRect _SDL_UnionRect;
	extern(C) void SDL_UnionRect(const(SDL_Rect)* a, const(SDL_Rect)* b, SDL_Rect* result){ _SDL_UnionRect(__traits(parameters)); }
	package _pSDL_EnclosePoints _SDL_EnclosePoints;
	extern(C) SDL_bool SDL_EnclosePoints(const(SDL_Point)* points, int count, const(SDL_Rect)* clip, SDL_Rect* result){ return _SDL_EnclosePoints(__traits(parameters)); }
	package _pSDL_IntersectRectAndLine _SDL_IntersectRectAndLine;
	extern(C) SDL_bool SDL_IntersectRectAndLine(const(SDL_Rect)* rect, int* x1, int* y1, int* x2, int* y2){ return _SDL_IntersectRectAndLine(__traits(parameters)); }
	package _pSDL_HasIntersectionF _SDL_HasIntersectionF;
	extern(C) SDL_bool SDL_HasIntersectionF(const(SDL_FRect)* a, const(SDL_FRect)* b){ return _SDL_HasIntersectionF(__traits(parameters)); }
	package _pSDL_IntersectFRect _SDL_IntersectFRect;
	extern(C) SDL_bool SDL_IntersectFRect(const(SDL_FRect)* a, const(SDL_FRect)* b, SDL_FRect* result){ return _SDL_IntersectFRect(__traits(parameters)); }
	package _pSDL_UnionFRect _SDL_UnionFRect;
	extern(C) SDL_bool SDL_UnionFRect(const(SDL_FRect)* a, const(SDL_FRect)* b, SDL_FRect* result){ return _SDL_UnionFRect(__traits(parameters)); }
	package _pSDL_EncloseFPoints _SDL_EncloseFPoints;
	extern(C) SDL_bool SDL_EncloseFPoints(const(SDL_FPoint)* points, int count, const(SDL_FRect)* clip, SDL_FRect* result){ return _SDL_EncloseFPoints(__traits(parameters)); }
	package _pSDL_IntersectFRectAndLine _SDL_IntersectFRectAndLine;
	extern(C) SDL_bool SDL_IntersectFRectAndLine(const(SDL_FRect)* rect, float* x1, float* y1, float* x2, float* y2){ return _SDL_IntersectFRectAndLine(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_HasIntersection, here.SDL_HasIntersection.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IntersectRect, here.SDL_IntersectRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnionRect, here.SDL_UnionRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_EnclosePoints, here.SDL_EnclosePoints.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IntersectRectAndLine, here.SDL_IntersectRectAndLine.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasIntersectionF, here.SDL_HasIntersectionF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IntersectFRect, here.SDL_IntersectFRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnionFRect, here.SDL_UnionFRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_EncloseFPoints, here.SDL_EncloseFPoints.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IntersectFRectAndLine, here.SDL_IntersectFRectAndLine.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/pixels.d(361,1)
private nothrow @nogc{
	alias _pSDL_GetPixelFormatName = extern(C) const(char)* function(SDL_PixelFormatEnum format);
	alias _pSDL_PixelFormatEnumToMasks = extern(C) SDL_bool function(SDL_PixelFormatEnum format, int* bpp, uint* rMask, uint* gMask, uint* bMask, uint* aMask);
	alias _pSDL_MasksToPixelFormatEnum = extern(C) uint function(int bpp, uint rMask, uint gMask, uint bMask, uint aMask);
	alias _pSDL_AllocFormat = extern(C) SDL_PixelFormat* function(uint pixelFormat);
	alias _pSDL_FreeFormat = extern(C) void function(SDL_PixelFormat* format);
	alias _pSDL_AllocPalette = extern(C) SDL_Palette* function(int nColours);
	alias _pSDL_SetPixelFormatPalette = extern(C) int function(SDL_PixelFormat* format, SDL_Palette* palette);
	alias _pSDL_SetPaletteColors = extern(C) int function(SDL_Palette* palette, const(SDL_Color)* colours, int firstColour, int nColours);
	alias _pSDL_FreePalette = extern(C) void function(SDL_Palette* palette);
	alias _pSDL_MapRGB = extern(C) uint function(const(SDL_PixelFormat)* format, ubyte r, ubyte g, ubyte b);
	alias _pSDL_MapRGBA = extern(C) uint function(const(SDL_PixelFormat)* format, ubyte r, ubyte g, ubyte b, ubyte a);
	alias _pSDL_GetRGB = extern(C) void function(uint pixel, const(SDL_PixelFormat)* format, ubyte* r, ubyte* g, ubyte* b);
	alias _pSDL_GetRGBA = extern(C) void function(uint pixel, const(SDL_PixelFormat)* format, ubyte* r, ubyte* g, ubyte* b, ubyte* a);
	alias _pSDL_CalculateGammaRamp = extern(C) void function(float gamma, ushort* ramp);
}
__gshared nothrow @nogc{
	package _pSDL_GetPixelFormatName _SDL_GetPixelFormatName;
	extern(C) const(char)* SDL_GetPixelFormatName(SDL_PixelFormatEnum format){ return _SDL_GetPixelFormatName(__traits(parameters)); }
	package _pSDL_PixelFormatEnumToMasks _SDL_PixelFormatEnumToMasks;
	extern(C) SDL_bool SDL_PixelFormatEnumToMasks(SDL_PixelFormatEnum format, int* bpp, uint* rMask, uint* gMask, uint* bMask, uint* aMask){ return _SDL_PixelFormatEnumToMasks(__traits(parameters)); }
	package _pSDL_MasksToPixelFormatEnum _SDL_MasksToPixelFormatEnum;
	extern(C) uint SDL_MasksToPixelFormatEnum(int bpp, uint rMask, uint gMask, uint bMask, uint aMask){ return _SDL_MasksToPixelFormatEnum(__traits(parameters)); }
	package _pSDL_AllocFormat _SDL_AllocFormat;
	extern(C) SDL_PixelFormat* SDL_AllocFormat(uint pixelFormat){ return _SDL_AllocFormat(__traits(parameters)); }
	package _pSDL_FreeFormat _SDL_FreeFormat;
	extern(C) void SDL_FreeFormat(SDL_PixelFormat* format){ _SDL_FreeFormat(__traits(parameters)); }
	package _pSDL_AllocPalette _SDL_AllocPalette;
	extern(C) SDL_Palette* SDL_AllocPalette(int nColours){ return _SDL_AllocPalette(__traits(parameters)); }
	package _pSDL_SetPixelFormatPalette _SDL_SetPixelFormatPalette;
	extern(C) int SDL_SetPixelFormatPalette(SDL_PixelFormat* format, SDL_Palette* palette){ return _SDL_SetPixelFormatPalette(__traits(parameters)); }
	package _pSDL_SetPaletteColors _SDL_SetPaletteColors;
	extern(C) int SDL_SetPaletteColors(SDL_Palette* palette, const(SDL_Color)* colours, int firstColour, int nColours){ return _SDL_SetPaletteColors(__traits(parameters)); }
	package _pSDL_FreePalette _SDL_FreePalette;
	extern(C) void SDL_FreePalette(SDL_Palette* palette){ _SDL_FreePalette(__traits(parameters)); }
	package _pSDL_MapRGB _SDL_MapRGB;
	extern(C) uint SDL_MapRGB(const(SDL_PixelFormat)* format, ubyte r, ubyte g, ubyte b){ return _SDL_MapRGB(__traits(parameters)); }
	package _pSDL_MapRGBA _SDL_MapRGBA;
	extern(C) uint SDL_MapRGBA(const(SDL_PixelFormat)* format, ubyte r, ubyte g, ubyte b, ubyte a){ return _SDL_MapRGBA(__traits(parameters)); }
	package _pSDL_GetRGB _SDL_GetRGB;
	extern(C) void SDL_GetRGB(uint pixel, const(SDL_PixelFormat)* format, ubyte* r, ubyte* g, ubyte* b){ _SDL_GetRGB(__traits(parameters)); }
	package _pSDL_GetRGBA _SDL_GetRGBA;
	extern(C) void SDL_GetRGBA(uint pixel, const(SDL_PixelFormat)* format, ubyte* r, ubyte* g, ubyte* b, ubyte* a){ _SDL_GetRGBA(__traits(parameters)); }
	package _pSDL_CalculateGammaRamp _SDL_CalculateGammaRamp;
	extern(C) void SDL_CalculateGammaRamp(float gamma, ushort* ramp){ _SDL_CalculateGammaRamp(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetPixelFormatName, here.SDL_GetPixelFormatName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_PixelFormatEnumToMasks, here.SDL_PixelFormatEnumToMasks.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MasksToPixelFormatEnum, here.SDL_MasksToPixelFormatEnum.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AllocFormat, here.SDL_AllocFormat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FreeFormat, here.SDL_FreeFormat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AllocPalette, here.SDL_AllocPalette.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetPixelFormatPalette, here.SDL_SetPixelFormatPalette.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetPaletteColors, here.SDL_SetPaletteColors.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FreePalette, here.SDL_FreePalette.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MapRGB, here.SDL_MapRGB.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MapRGBA, here.SDL_MapRGBA.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRGB, here.SDL_GetRGB.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRGBA, here.SDL_GetRGBA.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CalculateGammaRamp, here.SDL_CalculateGammaRamp.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/surface.d(78,1)
private nothrow @nogc{
	alias _pSDL_CreateRGBSurface = extern(C) SDL_Surface* function(uint flags, int width, int height, int depth, uint rMask, uint gMask, uint bMask, uint aMask);
	alias _pSDL_CreateRGBSurfaceFrom = extern(C) SDL_Surface* function(void* pixels, int width, int height, int depth, int pitch, uint rMask, uint gMask, uint bMask, uint aMask);
	alias _pSDL_FreeSurface = extern(C) void function(SDL_Surface* surface);
	alias _pSDL_SetSurfacePalette = extern(C) int function(SDL_Surface* surface, SDL_Palette* palette);
	alias _pSDL_LockSurface = extern(C) int function(SDL_Surface* surface);
	alias _pSDL_UnlockSurface = extern(C) int function(SDL_Surface* surface);
	alias _pSDL_LoadBMP_RW = extern(C) SDL_Surface* function(SDL_RWops* src, int freeSrc);
	alias _pSDL_SaveBMP_RW = extern(C) int function(SDL_Surface* surface, SDL_RWops* dst, int freeDst);
	alias _pSDL_SetSurfaceRLE = extern(C) int function(SDL_Surface* surface, int flag);
	alias _pSDL_SetColorKey = extern(C) int function(SDL_Surface* surface, int flag, uint key);
	alias _pSDL_GetColorKey = extern(C) int function(SDL_Surface* surface, uint* key);
	alias _pSDL_SetSurfaceColorMod = extern(C) int function(SDL_Surface* surface, ubyte r, ubyte g, ubyte b);
	alias _pSDL_GetSurfaceColorMod = extern(C) int function(SDL_Surface* surface, ubyte* r, ubyte* g, ubyte* b);
	alias _pSDL_SetSurfaceAlphaMod = extern(C) int function(SDL_Surface* surface, ubyte alpha);
	alias _pSDL_GetSurfaceAlphaMod = extern(C) int function(SDL_Surface* surface, ubyte* alpha);
	alias _pSDL_SetSurfaceBlendMode = extern(C) int function(SDL_Surface* surface, SDL_BlendMode blendMode);
	alias _pSDL_GetSurfaceBlendMode = extern(C) int function(SDL_Surface* surface, SDL_BlendMode* blendMode);
	alias _pSDL_SetClipRect = extern(C) SDL_bool function(SDL_Surface* surface, const(SDL_Rect)* rect);
	alias _pSDL_GetClipRect = extern(C) void function(SDL_Surface* surface, SDL_Rect* rect);
	alias _pSDL_ConvertSurface = extern(C) SDL_Surface* function(SDL_Surface* surface, const(SDL_PixelFormat)* fmt, uint flags);
	alias _pSDL_ConvertSurfaceFormat = extern(C) SDL_Surface* function(SDL_Surface* surface, uint pixelFormat, uint flags);
	alias _pSDL_ConvertPixels = extern(C) int function(int width, int height, uint srcFormat, const(void)* src, int srcPitch, uint dstFormat, void* dst, int dstPitch);
	alias _pSDL_FillRect = extern(C) int function(SDL_Surface* surface, const(SDL_Rect)* rect, uint colour);
	alias _pSDL_FillRects = extern(C) int function(SDL_Surface* surface, const(SDL_Rect)* rects, int count, uint colour);
	alias _pSDL_UpperBlit = extern(C) int function(SDL_Surface* src, const(SDL_Rect)* srcrect, SDL_Surface* dst, SDL_Rect* dstRect);
	alias _pSDL_LowerBlit = extern(C) int function(SDL_Surface* src, SDL_Rect* srcRect, SDL_Surface* dst, SDL_Rect* dstRect);
	alias _pSDL_SoftStretch = extern(C) int function(SDL_Surface* src, const(SDL_Rect)* srcRect, SDL_Surface* dst, const(SDL_Rect)* dstRect);
	alias _pSDL_UpperBlitScaled = extern(C) int function(SDL_Surface* src, const(SDL_Rect)* srcRect, SDL_Surface* dst, SDL_Rect* dstRect);
	alias _pSDL_LowerBlitScaled = extern(C) int function(SDL_Surface* src, SDL_Rect* srcRect, SDL_Surface* dst, SDL_Rect* dstRect);
	alias _pSDL_CreateRGBSurfaceWithFormat = extern(C) SDL_Surface* function(uint flags, int width, int height, int depth, uint format);
	alias _pSDL_CreateRGBSurfaceWithFormatFrom = extern(C) SDL_Surface* function(void* pixels, int width, int height, int depth, int pitch, uint format);
	alias _pSDL_DuplicateSurface = extern(C) SDL_Surface* function(SDL_Surface* surface);
	alias _pSDL_SetYUVConversionMode = extern(C) void function(SDL_YUV_CONVERSION_MODE mode);
	alias _pSDL_GetYUVConversionMode = extern(C) SDL_YUV_CONVERSION_MODE function();
	alias _pSDL_GetYUVConversionModeForResolution = extern(C) SDL_YUV_CONVERSION_MODE function(int width, int height);
	alias _pSDL_HasColorKey = extern(C) SDL_bool function(SDL_Surface* surface);
	alias _pSDL_SoftStretchLinear = extern(C) int function(SDL_Surface* src, const(SDL_Rect)* srcRect, SDL_Surface* dst, const(SDL_Rect)* dstRect);
	alias _pSDL_PremultiplyAlpha = extern(C) int function(int width, int height, uint srcFormat, const(void)* src, int srcPitch, uint dstFormat, void* dst, int dstPitch);
}
__gshared nothrow @nogc{
	package _pSDL_CreateRGBSurface _SDL_CreateRGBSurface;
	extern(C) SDL_Surface* SDL_CreateRGBSurface(uint flags, int width, int height, int depth, uint rMask, uint gMask, uint bMask, uint aMask){ return _SDL_CreateRGBSurface(__traits(parameters)); }
	package _pSDL_CreateRGBSurfaceFrom _SDL_CreateRGBSurfaceFrom;
	extern(C) SDL_Surface* SDL_CreateRGBSurfaceFrom(void* pixels, int width, int height, int depth, int pitch, uint rMask, uint gMask, uint bMask, uint aMask){ return _SDL_CreateRGBSurfaceFrom(__traits(parameters)); }
	package _pSDL_FreeSurface _SDL_FreeSurface;
	extern(C) void SDL_FreeSurface(SDL_Surface* surface){ _SDL_FreeSurface(__traits(parameters)); }
	package _pSDL_SetSurfacePalette _SDL_SetSurfacePalette;
	extern(C) int SDL_SetSurfacePalette(SDL_Surface* surface, SDL_Palette* palette){ return _SDL_SetSurfacePalette(__traits(parameters)); }
	package _pSDL_LockSurface _SDL_LockSurface;
	extern(C) int SDL_LockSurface(SDL_Surface* surface){ return _SDL_LockSurface(__traits(parameters)); }
	package _pSDL_UnlockSurface _SDL_UnlockSurface;
	extern(C) int SDL_UnlockSurface(SDL_Surface* surface){ return _SDL_UnlockSurface(__traits(parameters)); }
	package _pSDL_LoadBMP_RW _SDL_LoadBMP_RW;
	extern(C) SDL_Surface* SDL_LoadBMP_RW(SDL_RWops* src, int freeSrc){ return _SDL_LoadBMP_RW(__traits(parameters)); }
	package _pSDL_SaveBMP_RW _SDL_SaveBMP_RW;
	extern(C) int SDL_SaveBMP_RW(SDL_Surface* surface, SDL_RWops* dst, int freeDst){ return _SDL_SaveBMP_RW(__traits(parameters)); }
	package _pSDL_SetSurfaceRLE _SDL_SetSurfaceRLE;
	extern(C) int SDL_SetSurfaceRLE(SDL_Surface* surface, int flag){ return _SDL_SetSurfaceRLE(__traits(parameters)); }
	package _pSDL_SetColorKey _SDL_SetColorKey;
	extern(C) int SDL_SetColorKey(SDL_Surface* surface, int flag, uint key){ return _SDL_SetColorKey(__traits(parameters)); }
	package _pSDL_GetColorKey _SDL_GetColorKey;
	extern(C) int SDL_GetColorKey(SDL_Surface* surface, uint* key){ return _SDL_GetColorKey(__traits(parameters)); }
	package _pSDL_SetSurfaceColorMod _SDL_SetSurfaceColorMod;
	extern(C) int SDL_SetSurfaceColorMod(SDL_Surface* surface, ubyte r, ubyte g, ubyte b){ return _SDL_SetSurfaceColorMod(__traits(parameters)); }
	package _pSDL_GetSurfaceColorMod _SDL_GetSurfaceColorMod;
	extern(C) int SDL_GetSurfaceColorMod(SDL_Surface* surface, ubyte* r, ubyte* g, ubyte* b){ return _SDL_GetSurfaceColorMod(__traits(parameters)); }
	package _pSDL_SetSurfaceAlphaMod _SDL_SetSurfaceAlphaMod;
	extern(C) int SDL_SetSurfaceAlphaMod(SDL_Surface* surface, ubyte alpha){ return _SDL_SetSurfaceAlphaMod(__traits(parameters)); }
	package _pSDL_GetSurfaceAlphaMod _SDL_GetSurfaceAlphaMod;
	extern(C) int SDL_GetSurfaceAlphaMod(SDL_Surface* surface, ubyte* alpha){ return _SDL_GetSurfaceAlphaMod(__traits(parameters)); }
	package _pSDL_SetSurfaceBlendMode _SDL_SetSurfaceBlendMode;
	extern(C) int SDL_SetSurfaceBlendMode(SDL_Surface* surface, SDL_BlendMode blendMode){ return _SDL_SetSurfaceBlendMode(__traits(parameters)); }
	package _pSDL_GetSurfaceBlendMode _SDL_GetSurfaceBlendMode;
	extern(C) int SDL_GetSurfaceBlendMode(SDL_Surface* surface, SDL_BlendMode* blendMode){ return _SDL_GetSurfaceBlendMode(__traits(parameters)); }
	package _pSDL_SetClipRect _SDL_SetClipRect;
	extern(C) SDL_bool SDL_SetClipRect(SDL_Surface* surface, const(SDL_Rect)* rect){ return _SDL_SetClipRect(__traits(parameters)); }
	package _pSDL_GetClipRect _SDL_GetClipRect;
	extern(C) void SDL_GetClipRect(SDL_Surface* surface, SDL_Rect* rect){ _SDL_GetClipRect(__traits(parameters)); }
	package _pSDL_ConvertSurface _SDL_ConvertSurface;
	extern(C) SDL_Surface* SDL_ConvertSurface(SDL_Surface* surface, const(SDL_PixelFormat)* fmt, uint flags){ return _SDL_ConvertSurface(__traits(parameters)); }
	package _pSDL_ConvertSurfaceFormat _SDL_ConvertSurfaceFormat;
	extern(C) SDL_Surface* SDL_ConvertSurfaceFormat(SDL_Surface* surface, uint pixelFormat, uint flags){ return _SDL_ConvertSurfaceFormat(__traits(parameters)); }
	package _pSDL_ConvertPixels _SDL_ConvertPixels;
	extern(C) int SDL_ConvertPixels(int width, int height, uint srcFormat, const(void)* src, int srcPitch, uint dstFormat, void* dst, int dstPitch){ return _SDL_ConvertPixels(__traits(parameters)); }
	package _pSDL_FillRect _SDL_FillRect;
	extern(C) int SDL_FillRect(SDL_Surface* surface, const(SDL_Rect)* rect, uint colour){ return _SDL_FillRect(__traits(parameters)); }
	package _pSDL_FillRects _SDL_FillRects;
	extern(C) int SDL_FillRects(SDL_Surface* surface, const(SDL_Rect)* rects, int count, uint colour){ return _SDL_FillRects(__traits(parameters)); }
	package _pSDL_UpperBlit _SDL_UpperBlit;
	extern(C) int SDL_UpperBlit(SDL_Surface* src, const(SDL_Rect)* srcrect, SDL_Surface* dst, SDL_Rect* dstRect){ return _SDL_UpperBlit(__traits(parameters)); }
	package _pSDL_LowerBlit _SDL_LowerBlit;
	extern(C) int SDL_LowerBlit(SDL_Surface* src, SDL_Rect* srcRect, SDL_Surface* dst, SDL_Rect* dstRect){ return _SDL_LowerBlit(__traits(parameters)); }
	package _pSDL_SoftStretch _SDL_SoftStretch;
	extern(C) int SDL_SoftStretch(SDL_Surface* src, const(SDL_Rect)* srcRect, SDL_Surface* dst, const(SDL_Rect)* dstRect){ return _SDL_SoftStretch(__traits(parameters)); }
	package _pSDL_UpperBlitScaled _SDL_UpperBlitScaled;
	extern(C) int SDL_UpperBlitScaled(SDL_Surface* src, const(SDL_Rect)* srcRect, SDL_Surface* dst, SDL_Rect* dstRect){ return _SDL_UpperBlitScaled(__traits(parameters)); }
	package _pSDL_LowerBlitScaled _SDL_LowerBlitScaled;
	extern(C) int SDL_LowerBlitScaled(SDL_Surface* src, SDL_Rect* srcRect, SDL_Surface* dst, SDL_Rect* dstRect){ return _SDL_LowerBlitScaled(__traits(parameters)); }
	package _pSDL_CreateRGBSurfaceWithFormat _SDL_CreateRGBSurfaceWithFormat;
	extern(C) SDL_Surface* SDL_CreateRGBSurfaceWithFormat(uint flags, int width, int height, int depth, uint format){ return _SDL_CreateRGBSurfaceWithFormat(__traits(parameters)); }
	package _pSDL_CreateRGBSurfaceWithFormatFrom _SDL_CreateRGBSurfaceWithFormatFrom;
	extern(C) SDL_Surface* SDL_CreateRGBSurfaceWithFormatFrom(void* pixels, int width, int height, int depth, int pitch, uint format){ return _SDL_CreateRGBSurfaceWithFormatFrom(__traits(parameters)); }
	package _pSDL_DuplicateSurface _SDL_DuplicateSurface;
	extern(C) SDL_Surface* SDL_DuplicateSurface(SDL_Surface* surface){ return _SDL_DuplicateSurface(__traits(parameters)); }
	package _pSDL_SetYUVConversionMode _SDL_SetYUVConversionMode;
	extern(C) void SDL_SetYUVConversionMode(SDL_YUV_CONVERSION_MODE mode){ _SDL_SetYUVConversionMode(__traits(parameters)); }
	package _pSDL_GetYUVConversionMode _SDL_GetYUVConversionMode;
	extern(C) SDL_YUV_CONVERSION_MODE SDL_GetYUVConversionMode(){ return _SDL_GetYUVConversionMode(__traits(parameters)); }
	package _pSDL_GetYUVConversionModeForResolution _SDL_GetYUVConversionModeForResolution;
	extern(C) SDL_YUV_CONVERSION_MODE SDL_GetYUVConversionModeForResolution(int width, int height){ return _SDL_GetYUVConversionModeForResolution(__traits(parameters)); }
	package _pSDL_HasColorKey _SDL_HasColorKey;
	extern(C) SDL_bool SDL_HasColorKey(SDL_Surface* surface){ return _SDL_HasColorKey(__traits(parameters)); }
	package _pSDL_SoftStretchLinear _SDL_SoftStretchLinear;
	extern(C) int SDL_SoftStretchLinear(SDL_Surface* src, const(SDL_Rect)* srcRect, SDL_Surface* dst, const(SDL_Rect)* dstRect){ return _SDL_SoftStretchLinear(__traits(parameters)); }
	package _pSDL_PremultiplyAlpha _SDL_PremultiplyAlpha;
	extern(C) int SDL_PremultiplyAlpha(int width, int height, uint srcFormat, const(void)* src, int srcPitch, uint dstFormat, void* dst, int dstPitch){ return _SDL_PremultiplyAlpha(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_CreateRGBSurface, here.SDL_CreateRGBSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateRGBSurfaceFrom, here.SDL_CreateRGBSurfaceFrom.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FreeSurface, here.SDL_FreeSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetSurfacePalette, here.SDL_SetSurfacePalette.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockSurface, here.SDL_LockSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnlockSurface, here.SDL_UnlockSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LoadBMP_RW, here.SDL_LoadBMP_RW.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SaveBMP_RW, here.SDL_SaveBMP_RW.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetSurfaceRLE, here.SDL_SetSurfaceRLE.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetColorKey, here.SDL_SetColorKey.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetColorKey, here.SDL_GetColorKey.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetSurfaceColorMod, here.SDL_SetSurfaceColorMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetSurfaceColorMod, here.SDL_GetSurfaceColorMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetSurfaceAlphaMod, here.SDL_SetSurfaceAlphaMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetSurfaceAlphaMod, here.SDL_GetSurfaceAlphaMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetSurfaceBlendMode, here.SDL_SetSurfaceBlendMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetSurfaceBlendMode, here.SDL_GetSurfaceBlendMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetClipRect, here.SDL_SetClipRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetClipRect, here.SDL_GetClipRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ConvertSurface, here.SDL_ConvertSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ConvertSurfaceFormat, here.SDL_ConvertSurfaceFormat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ConvertPixels, here.SDL_ConvertPixels.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FillRect, here.SDL_FillRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FillRects, here.SDL_FillRects.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UpperBlit, here.SDL_UpperBlit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LowerBlit, here.SDL_LowerBlit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SoftStretch, here.SDL_SoftStretch.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UpperBlitScaled, here.SDL_UpperBlitScaled.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LowerBlitScaled, here.SDL_LowerBlitScaled.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateRGBSurfaceWithFormat, here.SDL_CreateRGBSurfaceWithFormat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateRGBSurfaceWithFormatFrom, here.SDL_CreateRGBSurfaceWithFormatFrom.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DuplicateSurface, here.SDL_DuplicateSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetYUVConversionMode, here.SDL_SetYUVConversionMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetYUVConversionMode, here.SDL_GetYUVConversionMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetYUVConversionModeForResolution, here.SDL_GetYUVConversionModeForResolution.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasColorKey, here.SDL_HasColorKey.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SoftStretchLinear, here.SDL_SoftStretchLinear.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_PremultiplyAlpha, here.SDL_PremultiplyAlpha.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/video.d(250,1)
private nothrow @nogc{
	alias _pSDL_GetNumVideoDrivers = extern(C) int function();
	alias _pSDL_GetVideoDriver = extern(C) const(char)* function(int index);
	alias _pSDL_VideoInit = extern(C) int function(const(char)* driverName);
	alias _pSDL_VideoQuit = extern(C) void function();
	alias _pSDL_GetCurrentVideoDriver = extern(C) const(char)* function();
	alias _pSDL_GetNumVideoDisplays = extern(C) int function();
	alias _pSDL_GetDisplayName = extern(C) const(char)* function(int displayIndex);
	alias _pSDL_GetDisplayBounds = extern(C) int function(int displayIndex, SDL_Rect* rect);
	alias _pSDL_GetNumDisplayModes = extern(C) int function(int displayIndex);
	alias _pSDL_GetDisplayMode = extern(C) int function(int displayIndex, int modeIndex, SDL_DisplayMode* mode);
	alias _pSDL_GetDesktopDisplayMode = extern(C) int function(int displayIndex, SDL_DisplayMode* mode);
	alias _pSDL_GetCurrentDisplayMode = extern(C) int function(int displayIndex, SDL_DisplayMode* mode);
	alias _pSDL_GetClosestDisplayMode = extern(C) SDL_DisplayMode* function(int displayIndex, const(SDL_DisplayMode)* mode, SDL_DisplayMode* closest);
	alias _pSDL_GetWindowDisplayIndex = extern(C) int function(SDL_Window* window);
	alias _pSDL_SetWindowDisplayMode = extern(C) int function(SDL_Window* window, const(SDL_DisplayMode)* mode);
	alias _pSDL_GetWindowDisplayMode = extern(C) int function(SDL_Window* window, SDL_DisplayMode* mode);
	alias _pSDL_GetWindowPixelFormat = extern(C) uint function(SDL_Window* window);
	alias _pSDL_CreateWindow = extern(C) SDL_Window* function(const(char)* title, int x, int y, int w, int h, SDL_WindowFlags flags);
	alias _pSDL_CreateWindowFrom = extern(C) SDL_Window* function(const(void)* data);
	alias _pSDL_GetWindowID = extern(C) uint function(SDL_Window* window);
	alias _pSDL_GetWindowFromID = extern(C) SDL_Window* function(uint id);
	alias _pSDL_GetWindowFlags = extern(C) SDL_WindowFlags function(SDL_Window* window);
	alias _pSDL_SetWindowTitle = extern(C) void function(SDL_Window* window, const(char)* title);
	alias _pSDL_GetWindowTitle = extern(C) const(char)* function(SDL_Window* window);
	alias _pSDL_SetWindowIcon = extern(C) void function(SDL_Window* window, SDL_Surface* icon);
	alias _pSDL_SetWindowData = extern(C) void* function(SDL_Window* window, const(char)* name, void* userData);
	alias _pSDL_GetWindowData = extern(C) void* function(SDL_Window* window, const(char)* name);
	alias _pSDL_SetWindowPosition = extern(C) void function(SDL_Window* window, int x, int y);
	alias _pSDL_GetWindowPosition = extern(C) void function(SDL_Window* window, int* x, int* y);
	alias _pSDL_SetWindowSize = extern(C) void function(SDL_Window* window, int w, int h);
	alias _pSDL_GetWindowSize = extern(C) void function(SDL_Window* window, int* w, int* h);
	alias _pSDL_SetWindowMinimumSize = extern(C) void function(SDL_Window* window, int minW, int minH);
	alias _pSDL_GetWindowMinimumSize = extern(C) void function(SDL_Window* window, int* w, int* h);
	alias _pSDL_SetWindowMaximumSize = extern(C) void function(SDL_Window* window, int maxW, int maxH);
	alias _pSDL_GetWindowMaximumSize = extern(C) void function(SDL_Window* window, int* w, int* h);
	alias _pSDL_SetWindowBordered = extern(C) void function(SDL_Window* window, SDL_bool bordered);
	alias _pSDL_ShowWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_HideWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_RaiseWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_MaximizeWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_MinimizeWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_RestoreWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_SetWindowFullscreen = extern(C) int function(SDL_Window* window, SDL_WindowFlags flags);
	alias _pSDL_GetWindowSurface = extern(C) SDL_Surface* function(SDL_Window* window);
	alias _pSDL_UpdateWindowSurface = extern(C) int function(SDL_Window* window);
	alias _pSDL_UpdateWindowSurfaceRects = extern(C) int function(SDL_Window* window, SDL_Rect* rects, int numRects);
	alias _pSDL_SetWindowGrab = extern(C) void function(SDL_Window* window, SDL_bool grabbed);
	alias _pSDL_GetWindowGrab = extern(C) SDL_bool function(SDL_Window* window);
	alias _pSDL_SetWindowBrightness = extern(C) int function(SDL_Window* window, float brightness);
	alias _pSDL_GetWindowBrightness = extern(C) float function(SDL_Window* window);
	alias _pSDL_SetWindowGammaRamp = extern(C) int function(SDL_Window* window, const(ushort)* red, const(ushort)* green, const(ushort)* blue);
	alias _pSDL_GetWindowGammaRamp = extern(C) int function(SDL_Window* window, ushort* red, ushort* green, ushort* blue);
	alias _pSDL_DestroyWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_IsScreenSaverEnabled = extern(C) SDL_bool function();
	alias _pSDL_EnableScreenSaver = extern(C) void function();
	alias _pSDL_DisableScreenSaver = extern(C) void function();
	alias _pSDL_GL_LoadLibrary = extern(C) int function(const(char)* path);
	alias _pSDL_GL_GetProcAddress = extern(C) void* function(const(char)* proc);
	alias _pSDL_GL_UnloadLibrary = extern(C) void function();
	alias _pSDL_GL_ExtensionSupported = extern(C) SDL_bool function(const(char)* extension);
	alias _pSDL_GL_SetAttribute = extern(C) int function(SDL_GLattr attr, int value);
	alias _pSDL_GL_GetAttribute = extern(C) int function(SDL_GLattr attr, int* value);
	alias _pSDL_GL_CreateContext = extern(C) SDL_GLContext function(SDL_Window* window);
	alias _pSDL_GL_MakeCurrent = extern(C) int function(SDL_Window* window, SDL_GLContext context);
	alias _pSDL_GL_GetCurrentWindow = extern(C) SDL_Window* function();
	alias _pSDL_GL_GetCurrentContext = extern(C) SDL_GLContext function();
	alias _pSDL_GL_SetSwapInterval = extern(C) int function(int interval);
	alias _pSDL_GL_GetSwapInterval = extern(C) int function();
	alias _pSDL_GL_SwapWindow = extern(C) void function(SDL_Window* window);
	alias _pSDL_GL_DeleteContext = extern(C) void function(SDL_GLContext context);
	alias _pSDL_GL_GetDrawableSize = extern(C) void function(SDL_Window* window, int* w, int* h);
	alias _pSDL_GL_ResetAttributes = extern(C) void function();
	alias _pSDL_GetDisplayDPI = extern(C) int function(int displayIndex, float* ddpi, float* hdpi, float* vdpi);
	alias _pSDL_GetGrabbedWindow = extern(C) SDL_Window* function();
	alias _pSDL_SetWindowHitTest = extern(C) int function(SDL_Window* window, SDL_HitTest callback, void* callbackData);
	alias _pSDL_GetDisplayUsableBounds = extern(C) int function(int displayIndex, SDL_Rect* rect);
	alias _pSDL_GetWindowBordersSize = extern(C) int function(SDL_Window* window, int* top, int* left, int* bottom, int* right);
	alias _pSDL_GetWindowOpacity = extern(C) int function(SDL_Window* window, float* opacity);
	alias _pSDL_SetWindowInputFocus = extern(C) int function(SDL_Window* window);
	alias _pSDL_SetWindowModalFor = extern(C) int function(SDL_Window* modalWindow, SDL_Window* parentWindow);
	alias _pSDL_SetWindowOpacity = extern(C) int function(SDL_Window* window, float opacity);
	alias _pSDL_SetWindowResizable = extern(C) void function(SDL_Window* window, SDL_bool resizable);
	alias _pSDL_GetDisplayOrientation = extern(C) SDL_DisplayOrientation function(int displayIndex);
	alias _pSDL_FlashWindow = extern(C) int function(SDL_Window* window, SDL_FlashOperation operation);
	alias _pSDL_SetWindowAlwaysOnTop = extern(C) void function(SDL_Window* window, SDL_bool on_top);
	alias _pSDL_SetWindowKeyboardGrab = extern(C) void function(SDL_Window* window, SDL_bool grabbed);
	alias _pSDL_GetWindowKeyboardGrab = extern(C) SDL_bool function(SDL_Window * window);
	alias _pSDL_SetWindowMouseGrab = extern(C) void function(SDL_Window* window, SDL_bool grabbed);
	alias _pSDL_GetWindowMouseGrab = extern(C) SDL_bool function(SDL_Window* window);
	alias _pSDL_GetWindowICCProfile = extern(C) void* function(SDL_Window* window, size_t* size);
	alias _pSDL_SetWindowMouseRect = extern(C) int function(SDL_Window* window, const(SDL_Rect)* rect);
	alias _pSDL_GetWindowMouseRect = extern(C) const(SDL_Rect)* function(SDL_Window* window);
	alias _pSDL_GetPointDisplayIndex = extern(C) int function(const(SDL_Point)* point);
	alias _pSDL_GetRectDisplayIndex = extern(C) int function(const(SDL_Rect)* rect);
	alias _pSDL_GetWindowSizeInPixels = extern(C) void function(SDL_Window* window, int* w, int* h);
}
__gshared nothrow @nogc{
	package _pSDL_GetNumVideoDrivers _SDL_GetNumVideoDrivers;
	extern(C) int SDL_GetNumVideoDrivers(){ return _SDL_GetNumVideoDrivers(__traits(parameters)); }
	package _pSDL_GetVideoDriver _SDL_GetVideoDriver;
	extern(C) const(char)* SDL_GetVideoDriver(int index){ return _SDL_GetVideoDriver(__traits(parameters)); }
	package _pSDL_VideoInit _SDL_VideoInit;
	extern(C) int SDL_VideoInit(const(char)* driverName){ return _SDL_VideoInit(__traits(parameters)); }
	package _pSDL_VideoQuit _SDL_VideoQuit;
	extern(C) void SDL_VideoQuit(){ _SDL_VideoQuit(__traits(parameters)); }
	package _pSDL_GetCurrentVideoDriver _SDL_GetCurrentVideoDriver;
	extern(C) const(char)* SDL_GetCurrentVideoDriver(){ return _SDL_GetCurrentVideoDriver(__traits(parameters)); }
	package _pSDL_GetNumVideoDisplays _SDL_GetNumVideoDisplays;
	extern(C) int SDL_GetNumVideoDisplays(){ return _SDL_GetNumVideoDisplays(__traits(parameters)); }
	package _pSDL_GetDisplayName _SDL_GetDisplayName;
	extern(C) const(char)* SDL_GetDisplayName(int displayIndex){ return _SDL_GetDisplayName(__traits(parameters)); }
	package _pSDL_GetDisplayBounds _SDL_GetDisplayBounds;
	extern(C) int SDL_GetDisplayBounds(int displayIndex, SDL_Rect* rect){ return _SDL_GetDisplayBounds(__traits(parameters)); }
	package _pSDL_GetNumDisplayModes _SDL_GetNumDisplayModes;
	extern(C) int SDL_GetNumDisplayModes(int displayIndex){ return _SDL_GetNumDisplayModes(__traits(parameters)); }
	package _pSDL_GetDisplayMode _SDL_GetDisplayMode;
	extern(C) int SDL_GetDisplayMode(int displayIndex, int modeIndex, SDL_DisplayMode* mode){ return _SDL_GetDisplayMode(__traits(parameters)); }
	package _pSDL_GetDesktopDisplayMode _SDL_GetDesktopDisplayMode;
	extern(C) int SDL_GetDesktopDisplayMode(int displayIndex, SDL_DisplayMode* mode){ return _SDL_GetDesktopDisplayMode(__traits(parameters)); }
	package _pSDL_GetCurrentDisplayMode _SDL_GetCurrentDisplayMode;
	extern(C) int SDL_GetCurrentDisplayMode(int displayIndex, SDL_DisplayMode* mode){ return _SDL_GetCurrentDisplayMode(__traits(parameters)); }
	package _pSDL_GetClosestDisplayMode _SDL_GetClosestDisplayMode;
	extern(C) SDL_DisplayMode* SDL_GetClosestDisplayMode(int displayIndex, const(SDL_DisplayMode)* mode, SDL_DisplayMode* closest){ return _SDL_GetClosestDisplayMode(__traits(parameters)); }
	package _pSDL_GetWindowDisplayIndex _SDL_GetWindowDisplayIndex;
	extern(C) int SDL_GetWindowDisplayIndex(SDL_Window* window){ return _SDL_GetWindowDisplayIndex(__traits(parameters)); }
	package _pSDL_SetWindowDisplayMode _SDL_SetWindowDisplayMode;
	extern(C) int SDL_SetWindowDisplayMode(SDL_Window* window, const(SDL_DisplayMode)* mode){ return _SDL_SetWindowDisplayMode(__traits(parameters)); }
	package _pSDL_GetWindowDisplayMode _SDL_GetWindowDisplayMode;
	extern(C) int SDL_GetWindowDisplayMode(SDL_Window* window, SDL_DisplayMode* mode){ return _SDL_GetWindowDisplayMode(__traits(parameters)); }
	package _pSDL_GetWindowPixelFormat _SDL_GetWindowPixelFormat;
	extern(C) uint SDL_GetWindowPixelFormat(SDL_Window* window){ return _SDL_GetWindowPixelFormat(__traits(parameters)); }
	package _pSDL_CreateWindow _SDL_CreateWindow;
	extern(C) SDL_Window* SDL_CreateWindow(const(char)* title, int x, int y, int w, int h, SDL_WindowFlags flags){ return _SDL_CreateWindow(__traits(parameters)); }
	package _pSDL_CreateWindowFrom _SDL_CreateWindowFrom;
	extern(C) SDL_Window* SDL_CreateWindowFrom(const(void)* data){ return _SDL_CreateWindowFrom(__traits(parameters)); }
	package _pSDL_GetWindowID _SDL_GetWindowID;
	extern(C) uint SDL_GetWindowID(SDL_Window* window){ return _SDL_GetWindowID(__traits(parameters)); }
	package _pSDL_GetWindowFromID _SDL_GetWindowFromID;
	extern(C) SDL_Window* SDL_GetWindowFromID(uint id){ return _SDL_GetWindowFromID(__traits(parameters)); }
	package _pSDL_GetWindowFlags _SDL_GetWindowFlags;
	extern(C) SDL_WindowFlags SDL_GetWindowFlags(SDL_Window* window){ return _SDL_GetWindowFlags(__traits(parameters)); }
	package _pSDL_SetWindowTitle _SDL_SetWindowTitle;
	extern(C) void SDL_SetWindowTitle(SDL_Window* window, const(char)* title){ _SDL_SetWindowTitle(__traits(parameters)); }
	package _pSDL_GetWindowTitle _SDL_GetWindowTitle;
	extern(C) const(char)* SDL_GetWindowTitle(SDL_Window* window){ return _SDL_GetWindowTitle(__traits(parameters)); }
	package _pSDL_SetWindowIcon _SDL_SetWindowIcon;
	extern(C) void SDL_SetWindowIcon(SDL_Window* window, SDL_Surface* icon){ _SDL_SetWindowIcon(__traits(parameters)); }
	package _pSDL_SetWindowData _SDL_SetWindowData;
	extern(C) void* SDL_SetWindowData(SDL_Window* window, const(char)* name, void* userData){ return _SDL_SetWindowData(__traits(parameters)); }
	package _pSDL_GetWindowData _SDL_GetWindowData;
	extern(C) void* SDL_GetWindowData(SDL_Window* window, const(char)* name){ return _SDL_GetWindowData(__traits(parameters)); }
	package _pSDL_SetWindowPosition _SDL_SetWindowPosition;
	extern(C) void SDL_SetWindowPosition(SDL_Window* window, int x, int y){ _SDL_SetWindowPosition(__traits(parameters)); }
	package _pSDL_GetWindowPosition _SDL_GetWindowPosition;
	extern(C) void SDL_GetWindowPosition(SDL_Window* window, int* x, int* y){ _SDL_GetWindowPosition(__traits(parameters)); }
	package _pSDL_SetWindowSize _SDL_SetWindowSize;
	extern(C) void SDL_SetWindowSize(SDL_Window* window, int w, int h){ _SDL_SetWindowSize(__traits(parameters)); }
	package _pSDL_GetWindowSize _SDL_GetWindowSize;
	extern(C) void SDL_GetWindowSize(SDL_Window* window, int* w, int* h){ _SDL_GetWindowSize(__traits(parameters)); }
	package _pSDL_SetWindowMinimumSize _SDL_SetWindowMinimumSize;
	extern(C) void SDL_SetWindowMinimumSize(SDL_Window* window, int minW, int minH){ _SDL_SetWindowMinimumSize(__traits(parameters)); }
	package _pSDL_GetWindowMinimumSize _SDL_GetWindowMinimumSize;
	extern(C) void SDL_GetWindowMinimumSize(SDL_Window* window, int* w, int* h){ _SDL_GetWindowMinimumSize(__traits(parameters)); }
	package _pSDL_SetWindowMaximumSize _SDL_SetWindowMaximumSize;
	extern(C) void SDL_SetWindowMaximumSize(SDL_Window* window, int maxW, int maxH){ _SDL_SetWindowMaximumSize(__traits(parameters)); }
	package _pSDL_GetWindowMaximumSize _SDL_GetWindowMaximumSize;
	extern(C) void SDL_GetWindowMaximumSize(SDL_Window* window, int* w, int* h){ _SDL_GetWindowMaximumSize(__traits(parameters)); }
	package _pSDL_SetWindowBordered _SDL_SetWindowBordered;
	extern(C) void SDL_SetWindowBordered(SDL_Window* window, SDL_bool bordered){ _SDL_SetWindowBordered(__traits(parameters)); }
	package _pSDL_ShowWindow _SDL_ShowWindow;
	extern(C) void SDL_ShowWindow(SDL_Window* window){ _SDL_ShowWindow(__traits(parameters)); }
	package _pSDL_HideWindow _SDL_HideWindow;
	extern(C) void SDL_HideWindow(SDL_Window* window){ _SDL_HideWindow(__traits(parameters)); }
	package _pSDL_RaiseWindow _SDL_RaiseWindow;
	extern(C) void SDL_RaiseWindow(SDL_Window* window){ _SDL_RaiseWindow(__traits(parameters)); }
	package _pSDL_MaximizeWindow _SDL_MaximizeWindow;
	extern(C) void SDL_MaximizeWindow(SDL_Window* window){ _SDL_MaximizeWindow(__traits(parameters)); }
	package _pSDL_MinimizeWindow _SDL_MinimizeWindow;
	extern(C) void SDL_MinimizeWindow(SDL_Window* window){ _SDL_MinimizeWindow(__traits(parameters)); }
	package _pSDL_RestoreWindow _SDL_RestoreWindow;
	extern(C) void SDL_RestoreWindow(SDL_Window* window){ _SDL_RestoreWindow(__traits(parameters)); }
	package _pSDL_SetWindowFullscreen _SDL_SetWindowFullscreen;
	extern(C) int SDL_SetWindowFullscreen(SDL_Window* window, SDL_WindowFlags flags){ return _SDL_SetWindowFullscreen(__traits(parameters)); }
	package _pSDL_GetWindowSurface _SDL_GetWindowSurface;
	extern(C) SDL_Surface* SDL_GetWindowSurface(SDL_Window* window){ return _SDL_GetWindowSurface(__traits(parameters)); }
	package _pSDL_UpdateWindowSurface _SDL_UpdateWindowSurface;
	extern(C) int SDL_UpdateWindowSurface(SDL_Window* window){ return _SDL_UpdateWindowSurface(__traits(parameters)); }
	package _pSDL_UpdateWindowSurfaceRects _SDL_UpdateWindowSurfaceRects;
	extern(C) int SDL_UpdateWindowSurfaceRects(SDL_Window* window, SDL_Rect* rects, int numRects){ return _SDL_UpdateWindowSurfaceRects(__traits(parameters)); }
	package _pSDL_SetWindowGrab _SDL_SetWindowGrab;
	extern(C) void SDL_SetWindowGrab(SDL_Window* window, SDL_bool grabbed){ _SDL_SetWindowGrab(__traits(parameters)); }
	package _pSDL_GetWindowGrab _SDL_GetWindowGrab;
	extern(C) SDL_bool SDL_GetWindowGrab(SDL_Window* window){ return _SDL_GetWindowGrab(__traits(parameters)); }
	package _pSDL_SetWindowBrightness _SDL_SetWindowBrightness;
	extern(C) int SDL_SetWindowBrightness(SDL_Window* window, float brightness){ return _SDL_SetWindowBrightness(__traits(parameters)); }
	package _pSDL_GetWindowBrightness _SDL_GetWindowBrightness;
	extern(C) float SDL_GetWindowBrightness(SDL_Window* window){ return _SDL_GetWindowBrightness(__traits(parameters)); }
	package _pSDL_SetWindowGammaRamp _SDL_SetWindowGammaRamp;
	extern(C) int SDL_SetWindowGammaRamp(SDL_Window* window, const(ushort)* red, const(ushort)* green, const(ushort)* blue){ return _SDL_SetWindowGammaRamp(__traits(parameters)); }
	package _pSDL_GetWindowGammaRamp _SDL_GetWindowGammaRamp;
	extern(C) int SDL_GetWindowGammaRamp(SDL_Window* window, ushort* red, ushort* green, ushort* blue){ return _SDL_GetWindowGammaRamp(__traits(parameters)); }
	package _pSDL_DestroyWindow _SDL_DestroyWindow;
	extern(C) void SDL_DestroyWindow(SDL_Window* window){ _SDL_DestroyWindow(__traits(parameters)); }
	package _pSDL_IsScreenSaverEnabled _SDL_IsScreenSaverEnabled;
	extern(C) SDL_bool SDL_IsScreenSaverEnabled(){ return _SDL_IsScreenSaverEnabled(__traits(parameters)); }
	package _pSDL_EnableScreenSaver _SDL_EnableScreenSaver;
	extern(C) void SDL_EnableScreenSaver(){ _SDL_EnableScreenSaver(__traits(parameters)); }
	package _pSDL_DisableScreenSaver _SDL_DisableScreenSaver;
	extern(C) void SDL_DisableScreenSaver(){ _SDL_DisableScreenSaver(__traits(parameters)); }
	package _pSDL_GL_LoadLibrary _SDL_GL_LoadLibrary;
	extern(C) int SDL_GL_LoadLibrary(const(char)* path){ return _SDL_GL_LoadLibrary(__traits(parameters)); }
	package _pSDL_GL_GetProcAddress _SDL_GL_GetProcAddress;
	extern(C) void* SDL_GL_GetProcAddress(const(char)* proc){ return _SDL_GL_GetProcAddress(__traits(parameters)); }
	package _pSDL_GL_UnloadLibrary _SDL_GL_UnloadLibrary;
	extern(C) void SDL_GL_UnloadLibrary(){ _SDL_GL_UnloadLibrary(__traits(parameters)); }
	package _pSDL_GL_ExtensionSupported _SDL_GL_ExtensionSupported;
	extern(C) SDL_bool SDL_GL_ExtensionSupported(const(char)* extension){ return _SDL_GL_ExtensionSupported(__traits(parameters)); }
	package _pSDL_GL_SetAttribute _SDL_GL_SetAttribute;
	extern(C) int SDL_GL_SetAttribute(SDL_GLattr attr, int value){ return _SDL_GL_SetAttribute(__traits(parameters)); }
	package _pSDL_GL_GetAttribute _SDL_GL_GetAttribute;
	extern(C) int SDL_GL_GetAttribute(SDL_GLattr attr, int* value){ return _SDL_GL_GetAttribute(__traits(parameters)); }
	package _pSDL_GL_CreateContext _SDL_GL_CreateContext;
	extern(C) SDL_GLContext SDL_GL_CreateContext(SDL_Window* window){ return _SDL_GL_CreateContext(__traits(parameters)); }
	package _pSDL_GL_MakeCurrent _SDL_GL_MakeCurrent;
	extern(C) int SDL_GL_MakeCurrent(SDL_Window* window, SDL_GLContext context){ return _SDL_GL_MakeCurrent(__traits(parameters)); }
	package _pSDL_GL_GetCurrentWindow _SDL_GL_GetCurrentWindow;
	extern(C) SDL_Window* SDL_GL_GetCurrentWindow(){ return _SDL_GL_GetCurrentWindow(__traits(parameters)); }
	package _pSDL_GL_GetCurrentContext _SDL_GL_GetCurrentContext;
	extern(C) SDL_GLContext SDL_GL_GetCurrentContext(){ return _SDL_GL_GetCurrentContext(__traits(parameters)); }
	package _pSDL_GL_SetSwapInterval _SDL_GL_SetSwapInterval;
	extern(C) int SDL_GL_SetSwapInterval(int interval){ return _SDL_GL_SetSwapInterval(__traits(parameters)); }
	package _pSDL_GL_GetSwapInterval _SDL_GL_GetSwapInterval;
	extern(C) int SDL_GL_GetSwapInterval(){ return _SDL_GL_GetSwapInterval(__traits(parameters)); }
	package _pSDL_GL_SwapWindow _SDL_GL_SwapWindow;
	extern(C) void SDL_GL_SwapWindow(SDL_Window* window){ _SDL_GL_SwapWindow(__traits(parameters)); }
	package _pSDL_GL_DeleteContext _SDL_GL_DeleteContext;
	extern(C) void SDL_GL_DeleteContext(SDL_GLContext context){ _SDL_GL_DeleteContext(__traits(parameters)); }
	package _pSDL_GL_GetDrawableSize _SDL_GL_GetDrawableSize;
	extern(C) void SDL_GL_GetDrawableSize(SDL_Window* window, int* w, int* h){ _SDL_GL_GetDrawableSize(__traits(parameters)); }
	package _pSDL_GL_ResetAttributes _SDL_GL_ResetAttributes;
	extern(C) void SDL_GL_ResetAttributes(){ _SDL_GL_ResetAttributes(__traits(parameters)); }
	package _pSDL_GetDisplayDPI _SDL_GetDisplayDPI;
	extern(C) int SDL_GetDisplayDPI(int displayIndex, float* ddpi, float* hdpi, float* vdpi){ return _SDL_GetDisplayDPI(__traits(parameters)); }
	package _pSDL_GetGrabbedWindow _SDL_GetGrabbedWindow;
	extern(C) SDL_Window* SDL_GetGrabbedWindow(){ return _SDL_GetGrabbedWindow(__traits(parameters)); }
	package _pSDL_SetWindowHitTest _SDL_SetWindowHitTest;
	extern(C) int SDL_SetWindowHitTest(SDL_Window* window, SDL_HitTest callback, void* callbackData){ return _SDL_SetWindowHitTest(__traits(parameters)); }
	package _pSDL_GetDisplayUsableBounds _SDL_GetDisplayUsableBounds;
	extern(C) int SDL_GetDisplayUsableBounds(int displayIndex, SDL_Rect* rect){ return _SDL_GetDisplayUsableBounds(__traits(parameters)); }
	package _pSDL_GetWindowBordersSize _SDL_GetWindowBordersSize;
	extern(C) int SDL_GetWindowBordersSize(SDL_Window* window, int* top, int* left, int* bottom, int* right){ return _SDL_GetWindowBordersSize(__traits(parameters)); }
	package _pSDL_GetWindowOpacity _SDL_GetWindowOpacity;
	extern(C) int SDL_GetWindowOpacity(SDL_Window* window, float* opacity){ return _SDL_GetWindowOpacity(__traits(parameters)); }
	package _pSDL_SetWindowInputFocus _SDL_SetWindowInputFocus;
	extern(C) int SDL_SetWindowInputFocus(SDL_Window* window){ return _SDL_SetWindowInputFocus(__traits(parameters)); }
	package _pSDL_SetWindowModalFor _SDL_SetWindowModalFor;
	extern(C) int SDL_SetWindowModalFor(SDL_Window* modalWindow, SDL_Window* parentWindow){ return _SDL_SetWindowModalFor(__traits(parameters)); }
	package _pSDL_SetWindowOpacity _SDL_SetWindowOpacity;
	extern(C) int SDL_SetWindowOpacity(SDL_Window* window, float opacity){ return _SDL_SetWindowOpacity(__traits(parameters)); }
	package _pSDL_SetWindowResizable _SDL_SetWindowResizable;
	extern(C) void SDL_SetWindowResizable(SDL_Window* window, SDL_bool resizable){ _SDL_SetWindowResizable(__traits(parameters)); }
	package _pSDL_GetDisplayOrientation _SDL_GetDisplayOrientation;
	extern(C) SDL_DisplayOrientation SDL_GetDisplayOrientation(int displayIndex){ return _SDL_GetDisplayOrientation(__traits(parameters)); }
	package _pSDL_FlashWindow _SDL_FlashWindow;
	extern(C) int SDL_FlashWindow(SDL_Window* window, SDL_FlashOperation operation){ return _SDL_FlashWindow(__traits(parameters)); }
	package _pSDL_SetWindowAlwaysOnTop _SDL_SetWindowAlwaysOnTop;
	extern(C) void SDL_SetWindowAlwaysOnTop(SDL_Window* window, SDL_bool on_top){ _SDL_SetWindowAlwaysOnTop(__traits(parameters)); }
	package _pSDL_SetWindowKeyboardGrab _SDL_SetWindowKeyboardGrab;
	extern(C) void SDL_SetWindowKeyboardGrab(SDL_Window* window, SDL_bool grabbed){ _SDL_SetWindowKeyboardGrab(__traits(parameters)); }
	package _pSDL_GetWindowKeyboardGrab _SDL_GetWindowKeyboardGrab;
	extern(C) SDL_bool SDL_GetWindowKeyboardGrab(SDL_Window * window){ return _SDL_GetWindowKeyboardGrab(__traits(parameters)); }
	package _pSDL_SetWindowMouseGrab _SDL_SetWindowMouseGrab;
	extern(C) void SDL_SetWindowMouseGrab(SDL_Window* window, SDL_bool grabbed){ _SDL_SetWindowMouseGrab(__traits(parameters)); }
	package _pSDL_GetWindowMouseGrab _SDL_GetWindowMouseGrab;
	extern(C) SDL_bool SDL_GetWindowMouseGrab(SDL_Window* window){ return _SDL_GetWindowMouseGrab(__traits(parameters)); }
	package _pSDL_GetWindowICCProfile _SDL_GetWindowICCProfile;
	extern(C) void* SDL_GetWindowICCProfile(SDL_Window* window, size_t* size){ return _SDL_GetWindowICCProfile(__traits(parameters)); }
	package _pSDL_SetWindowMouseRect _SDL_SetWindowMouseRect;
	extern(C) int SDL_SetWindowMouseRect(SDL_Window* window, const(SDL_Rect)* rect){ return _SDL_SetWindowMouseRect(__traits(parameters)); }
	package _pSDL_GetWindowMouseRect _SDL_GetWindowMouseRect;
	extern(C) const(SDL_Rect)* SDL_GetWindowMouseRect(SDL_Window* window){ return _SDL_GetWindowMouseRect(__traits(parameters)); }
	package _pSDL_GetPointDisplayIndex _SDL_GetPointDisplayIndex;
	extern(C) int SDL_GetPointDisplayIndex(const(SDL_Point)* point){ return _SDL_GetPointDisplayIndex(__traits(parameters)); }
	package _pSDL_GetRectDisplayIndex _SDL_GetRectDisplayIndex;
	extern(C) int SDL_GetRectDisplayIndex(const(SDL_Rect)* rect){ return _SDL_GetRectDisplayIndex(__traits(parameters)); }
	package _pSDL_GetWindowSizeInPixels _SDL_GetWindowSizeInPixels;
	extern(C) void SDL_GetWindowSizeInPixels(SDL_Window* window, int* w, int* h){ _SDL_GetWindowSizeInPixels(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetNumVideoDrivers, here.SDL_GetNumVideoDrivers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetVideoDriver, here.SDL_GetVideoDriver.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_VideoInit, here.SDL_VideoInit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_VideoQuit, here.SDL_VideoQuit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetCurrentVideoDriver, here.SDL_GetCurrentVideoDriver.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetNumVideoDisplays, here.SDL_GetNumVideoDisplays.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDisplayName, here.SDL_GetDisplayName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDisplayBounds, here.SDL_GetDisplayBounds.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetNumDisplayModes, here.SDL_GetNumDisplayModes.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDisplayMode, here.SDL_GetDisplayMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDesktopDisplayMode, here.SDL_GetDesktopDisplayMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetCurrentDisplayMode, here.SDL_GetCurrentDisplayMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetClosestDisplayMode, here.SDL_GetClosestDisplayMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowDisplayIndex, here.SDL_GetWindowDisplayIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowDisplayMode, here.SDL_SetWindowDisplayMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowDisplayMode, here.SDL_GetWindowDisplayMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowPixelFormat, here.SDL_GetWindowPixelFormat.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateWindow, here.SDL_CreateWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateWindowFrom, here.SDL_CreateWindowFrom.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowID, here.SDL_GetWindowID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowFromID, here.SDL_GetWindowFromID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowFlags, here.SDL_GetWindowFlags.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowTitle, here.SDL_SetWindowTitle.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowTitle, here.SDL_GetWindowTitle.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowIcon, here.SDL_SetWindowIcon.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowData, here.SDL_SetWindowData.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowData, here.SDL_GetWindowData.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowPosition, here.SDL_SetWindowPosition.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowPosition, here.SDL_GetWindowPosition.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowSize, here.SDL_SetWindowSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowSize, here.SDL_GetWindowSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowMinimumSize, here.SDL_SetWindowMinimumSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowMinimumSize, here.SDL_GetWindowMinimumSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowMaximumSize, here.SDL_SetWindowMaximumSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowMaximumSize, here.SDL_GetWindowMaximumSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowBordered, here.SDL_SetWindowBordered.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ShowWindow, here.SDL_ShowWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HideWindow, here.SDL_HideWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RaiseWindow, here.SDL_RaiseWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MaximizeWindow, here.SDL_MaximizeWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MinimizeWindow, here.SDL_MinimizeWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RestoreWindow, here.SDL_RestoreWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowFullscreen, here.SDL_SetWindowFullscreen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowSurface, here.SDL_GetWindowSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UpdateWindowSurface, here.SDL_UpdateWindowSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UpdateWindowSurfaceRects, here.SDL_UpdateWindowSurfaceRects.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowGrab, here.SDL_SetWindowGrab.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowGrab, here.SDL_GetWindowGrab.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowBrightness, here.SDL_SetWindowBrightness.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowBrightness, here.SDL_GetWindowBrightness.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowGammaRamp, here.SDL_SetWindowGammaRamp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowGammaRamp, here.SDL_GetWindowGammaRamp.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DestroyWindow, here.SDL_DestroyWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IsScreenSaverEnabled, here.SDL_IsScreenSaverEnabled.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_EnableScreenSaver, here.SDL_EnableScreenSaver.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DisableScreenSaver, here.SDL_DisableScreenSaver.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_LoadLibrary, here.SDL_GL_LoadLibrary.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_GetProcAddress, here.SDL_GL_GetProcAddress.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_UnloadLibrary, here.SDL_GL_UnloadLibrary.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_ExtensionSupported, here.SDL_GL_ExtensionSupported.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_SetAttribute, here.SDL_GL_SetAttribute.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_GetAttribute, here.SDL_GL_GetAttribute.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_CreateContext, here.SDL_GL_CreateContext.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_MakeCurrent, here.SDL_GL_MakeCurrent.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_GetCurrentWindow, here.SDL_GL_GetCurrentWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_GetCurrentContext, here.SDL_GL_GetCurrentContext.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_SetSwapInterval, here.SDL_GL_SetSwapInterval.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_GetSwapInterval, here.SDL_GL_GetSwapInterval.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_SwapWindow, here.SDL_GL_SwapWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_DeleteContext, here.SDL_GL_DeleteContext.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_GetDrawableSize, here.SDL_GL_GetDrawableSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_ResetAttributes, here.SDL_GL_ResetAttributes.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDisplayDPI, here.SDL_GetDisplayDPI.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetGrabbedWindow, here.SDL_GetGrabbedWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowHitTest, here.SDL_SetWindowHitTest.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDisplayUsableBounds, here.SDL_GetDisplayUsableBounds.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowBordersSize, here.SDL_GetWindowBordersSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowOpacity, here.SDL_GetWindowOpacity.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowInputFocus, here.SDL_SetWindowInputFocus.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowModalFor, here.SDL_SetWindowModalFor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowOpacity, here.SDL_SetWindowOpacity.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowResizable, here.SDL_SetWindowResizable.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDisplayOrientation, here.SDL_GetDisplayOrientation.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FlashWindow, here.SDL_FlashWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowAlwaysOnTop, here.SDL_SetWindowAlwaysOnTop.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowKeyboardGrab, here.SDL_SetWindowKeyboardGrab.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowKeyboardGrab, here.SDL_GetWindowKeyboardGrab.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowMouseGrab, here.SDL_SetWindowMouseGrab.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowMouseGrab, here.SDL_GetWindowMouseGrab.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowICCProfile, here.SDL_GetWindowICCProfile.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowMouseRect, here.SDL_SetWindowMouseRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowMouseRect, here.SDL_GetWindowMouseRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetPointDisplayIndex, here.SDL_GetPointDisplayIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRectDisplayIndex, here.SDL_GetRectDisplayIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetWindowSizeInPixels, here.SDL_GetWindowSizeInPixels.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/keyboard.d(26,1)
private nothrow @nogc{
	alias _pSDL_GetKeyboardFocus = extern(C) SDL_Window* function();
	alias _pSDL_GetKeyboardState = extern(C) ubyte* function(int* numKeys);
	alias _pSDL_GetModState = extern(C) SDL_Keymod function();
	alias _pSDL_SetModState = extern(C) void function(SDL_Keymod modState);
	alias _pSDL_GetKeyFromScancode = extern(C) SDL_KeyCode function(SDL_Scancode scancode);
	alias _pSDL_GetScancodeFromKey = extern(C) SDL_Scancode function(SDL_KeyCode key);
	alias _pSDL_GetScancodeName = extern(C) const(char)* function(SDL_Scancode scancode);
	alias _pSDL_GetScancodeFromName = extern(C) SDL_Scancode function(const(char)* name);
	alias _pSDL_GetKeyName = extern(C) const(char)* function(SDL_KeyCode key);
	alias _pSDL_GetKeyFromName = extern(C) SDL_KeyCode function(const(char)* name);
	alias _pSDL_StartTextInput = extern(C) void function();
	alias _pSDL_IsTextInputActive = extern(C) SDL_bool function();
	alias _pSDL_StopTextInput = extern(C) void function();
	alias _pSDL_HasScreenKeyboardSupport = extern(C) SDL_bool function();
	alias _pSDL_IsScreenKeyboardShown = extern(C) SDL_bool function(SDL_Window* window);
	alias _pSDL_ClearComposition = extern(C) void function();
	alias _pSDL_IsTextInputShown = extern(C) SDL_bool function();
	alias _pSDL_SetTextInputRect = extern(C) void function(const(SDL_Rect)* rect);
	alias _pSDL_ResetKeyboard = extern(C) void function();
}
__gshared nothrow @nogc{
	package _pSDL_GetKeyboardFocus _SDL_GetKeyboardFocus;
	extern(C) SDL_Window* SDL_GetKeyboardFocus(){ return _SDL_GetKeyboardFocus(__traits(parameters)); }
	package _pSDL_GetKeyboardState _SDL_GetKeyboardState;
	extern(C) ubyte* SDL_GetKeyboardState(int* numKeys){ return _SDL_GetKeyboardState(__traits(parameters)); }
	package _pSDL_GetModState _SDL_GetModState;
	extern(C) SDL_Keymod SDL_GetModState(){ return _SDL_GetModState(__traits(parameters)); }
	package _pSDL_SetModState _SDL_SetModState;
	extern(C) void SDL_SetModState(SDL_Keymod modState){ _SDL_SetModState(__traits(parameters)); }
	package _pSDL_GetKeyFromScancode _SDL_GetKeyFromScancode;
	extern(C) SDL_KeyCode SDL_GetKeyFromScancode(SDL_Scancode scancode){ return _SDL_GetKeyFromScancode(__traits(parameters)); }
	package _pSDL_GetScancodeFromKey _SDL_GetScancodeFromKey;
	extern(C) SDL_Scancode SDL_GetScancodeFromKey(SDL_KeyCode key){ return _SDL_GetScancodeFromKey(__traits(parameters)); }
	package _pSDL_GetScancodeName _SDL_GetScancodeName;
	extern(C) const(char)* SDL_GetScancodeName(SDL_Scancode scancode){ return _SDL_GetScancodeName(__traits(parameters)); }
	package _pSDL_GetScancodeFromName _SDL_GetScancodeFromName;
	extern(C) SDL_Scancode SDL_GetScancodeFromName(const(char)* name){ return _SDL_GetScancodeFromName(__traits(parameters)); }
	package _pSDL_GetKeyName _SDL_GetKeyName;
	extern(C) const(char)* SDL_GetKeyName(SDL_KeyCode key){ return _SDL_GetKeyName(__traits(parameters)); }
	package _pSDL_GetKeyFromName _SDL_GetKeyFromName;
	extern(C) SDL_KeyCode SDL_GetKeyFromName(const(char)* name){ return _SDL_GetKeyFromName(__traits(parameters)); }
	package _pSDL_StartTextInput _SDL_StartTextInput;
	extern(C) void SDL_StartTextInput(){ _SDL_StartTextInput(__traits(parameters)); }
	package _pSDL_IsTextInputActive _SDL_IsTextInputActive;
	extern(C) SDL_bool SDL_IsTextInputActive(){ return _SDL_IsTextInputActive(__traits(parameters)); }
	package _pSDL_StopTextInput _SDL_StopTextInput;
	extern(C) void SDL_StopTextInput(){ _SDL_StopTextInput(__traits(parameters)); }
	package _pSDL_HasScreenKeyboardSupport _SDL_HasScreenKeyboardSupport;
	extern(C) SDL_bool SDL_HasScreenKeyboardSupport(){ return _SDL_HasScreenKeyboardSupport(__traits(parameters)); }
	package _pSDL_IsScreenKeyboardShown _SDL_IsScreenKeyboardShown;
	extern(C) SDL_bool SDL_IsScreenKeyboardShown(SDL_Window* window){ return _SDL_IsScreenKeyboardShown(__traits(parameters)); }
	package _pSDL_ClearComposition _SDL_ClearComposition;
	extern(C) void SDL_ClearComposition(){ _SDL_ClearComposition(__traits(parameters)); }
	package _pSDL_IsTextInputShown _SDL_IsTextInputShown;
	extern(C) SDL_bool SDL_IsTextInputShown(){ return _SDL_IsTextInputShown(__traits(parameters)); }
	package _pSDL_SetTextInputRect _SDL_SetTextInputRect;
	extern(C) void SDL_SetTextInputRect(const(SDL_Rect)* rect){ _SDL_SetTextInputRect(__traits(parameters)); }
	package _pSDL_ResetKeyboard _SDL_ResetKeyboard;
	extern(C) void SDL_ResetKeyboard(){ _SDL_ResetKeyboard(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetKeyboardFocus, here.SDL_GetKeyboardFocus.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetKeyboardState, here.SDL_GetKeyboardState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetModState, here.SDL_GetModState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetModState, here.SDL_SetModState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetKeyFromScancode, here.SDL_GetKeyFromScancode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetScancodeFromKey, here.SDL_GetScancodeFromKey.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetScancodeName, here.SDL_GetScancodeName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetScancodeFromName, here.SDL_GetScancodeFromName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetKeyName, here.SDL_GetKeyName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetKeyFromName, here.SDL_GetKeyFromName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_StartTextInput, here.SDL_StartTextInput.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IsTextInputActive, here.SDL_IsTextInputActive.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_StopTextInput, here.SDL_StopTextInput.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasScreenKeyboardSupport, here.SDL_HasScreenKeyboardSupport.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IsScreenKeyboardShown, here.SDL_IsScreenKeyboardShown.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ClearComposition, here.SDL_ClearComposition.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IsTextInputShown, here.SDL_IsTextInputShown.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetTextInputRect, here.SDL_SetTextInputRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ResetKeyboard, here.SDL_ResetKeyboard.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/syswm.d(241,1)
private nothrow @nogc{
	alias _pSDL_GetWindowWMInfo = extern(C) SDL_bool function(SDL_Window* window, SDL_SysWMinfo* info);
}
__gshared nothrow @nogc{
	package _pSDL_GetWindowWMInfo _SDL_GetWindowWMInfo;
	extern(C) SDL_bool SDL_GetWindowWMInfo(SDL_Window* window, SDL_SysWMinfo* info){ return _SDL_GetWindowWMInfo(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetWindowWMInfo, here.SDL_GetWindowWMInfo.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/events.d(517,1)
private nothrow @nogc{
	alias _pSDL_PumpEvents = extern(C) void function();
	alias _pSDL_PeepEvents = extern(C) int function(SDL_Event* events, int numEvents, SDL_eventaction action, SDL_EventType minType, SDL_EventType maxType);
	alias _pSDL_HasEvent = extern(C) SDL_bool function(SDL_EventType type);
	alias _pSDL_HasEvents = extern(C) SDL_bool function(SDL_EventType minType, SDL_EventType maxType);
	alias _pSDL_FlushEvent = extern(C) void function(SDL_EventType type);
	alias _pSDL_FlushEvents = extern(C) void function(SDL_EventType minType, SDL_EventType maxType);
	alias _pSDL_PollEvent = extern(C) int function(SDL_Event* event);
	alias _pSDL_WaitEvent = extern(C) int function(SDL_Event* event);
	alias _pSDL_WaitEventTimeout = extern(C) int function(SDL_Event* event, int timeout);
	alias _pSDL_PushEvent = extern(C) int function(SDL_Event* event);
	alias _pSDL_SetEventFilter = extern(C) void function(SDL_EventFilter filter, void* userData);
	alias _pSDL_GetEventFilter = extern(C) SDL_bool function(SDL_EventFilter* filter, void** userData);
	alias _pSDL_AddEventWatch = extern(C) void function(SDL_EventFilter filter, void* userData);
	alias _pSDL_DelEventWatch = extern(C) void function(SDL_EventFilter filter, void* userData);
	alias _pSDL_FilterEvents = extern(C) void function(SDL_EventFilter filter, void* userData);
	alias _pSDL_EventState = extern(C) ubyte function(SDL_EventType type, int state);
	alias _pSDL_RegisterEvents = extern(C) SDL_EventType function(int numEvents);
}
__gshared nothrow @nogc{
	package _pSDL_PumpEvents _SDL_PumpEvents;
	extern(C) void SDL_PumpEvents(){ _SDL_PumpEvents(__traits(parameters)); }
	package _pSDL_PeepEvents _SDL_PeepEvents;
	extern(C) int SDL_PeepEvents(SDL_Event* events, int numEvents, SDL_eventaction action, SDL_EventType minType, SDL_EventType maxType){ return _SDL_PeepEvents(__traits(parameters)); }
	package _pSDL_HasEvent _SDL_HasEvent;
	extern(C) SDL_bool SDL_HasEvent(SDL_EventType type){ return _SDL_HasEvent(__traits(parameters)); }
	package _pSDL_HasEvents _SDL_HasEvents;
	extern(C) SDL_bool SDL_HasEvents(SDL_EventType minType, SDL_EventType maxType){ return _SDL_HasEvents(__traits(parameters)); }
	package _pSDL_FlushEvent _SDL_FlushEvent;
	extern(C) void SDL_FlushEvent(SDL_EventType type){ _SDL_FlushEvent(__traits(parameters)); }
	package _pSDL_FlushEvents _SDL_FlushEvents;
	extern(C) void SDL_FlushEvents(SDL_EventType minType, SDL_EventType maxType){ _SDL_FlushEvents(__traits(parameters)); }
	package _pSDL_PollEvent _SDL_PollEvent;
	extern(C) int SDL_PollEvent(SDL_Event* event){ return _SDL_PollEvent(__traits(parameters)); }
	package _pSDL_WaitEvent _SDL_WaitEvent;
	extern(C) int SDL_WaitEvent(SDL_Event* event){ return _SDL_WaitEvent(__traits(parameters)); }
	package _pSDL_WaitEventTimeout _SDL_WaitEventTimeout;
	extern(C) int SDL_WaitEventTimeout(SDL_Event* event, int timeout){ return _SDL_WaitEventTimeout(__traits(parameters)); }
	package _pSDL_PushEvent _SDL_PushEvent;
	extern(C) int SDL_PushEvent(SDL_Event* event){ return _SDL_PushEvent(__traits(parameters)); }
	package _pSDL_SetEventFilter _SDL_SetEventFilter;
	extern(C) void SDL_SetEventFilter(SDL_EventFilter filter, void* userData){ _SDL_SetEventFilter(__traits(parameters)); }
	package _pSDL_GetEventFilter _SDL_GetEventFilter;
	extern(C) SDL_bool SDL_GetEventFilter(SDL_EventFilter* filter, void** userData){ return _SDL_GetEventFilter(__traits(parameters)); }
	package _pSDL_AddEventWatch _SDL_AddEventWatch;
	extern(C) void SDL_AddEventWatch(SDL_EventFilter filter, void* userData){ _SDL_AddEventWatch(__traits(parameters)); }
	package _pSDL_DelEventWatch _SDL_DelEventWatch;
	extern(C) void SDL_DelEventWatch(SDL_EventFilter filter, void* userData){ _SDL_DelEventWatch(__traits(parameters)); }
	package _pSDL_FilterEvents _SDL_FilterEvents;
	extern(C) void SDL_FilterEvents(SDL_EventFilter filter, void* userData){ _SDL_FilterEvents(__traits(parameters)); }
	package _pSDL_EventState _SDL_EventState;
	extern(C) ubyte SDL_EventState(SDL_EventType type, int state){ return _SDL_EventState(__traits(parameters)); }
	package _pSDL_RegisterEvents _SDL_RegisterEvents;
	extern(C) SDL_EventType SDL_RegisterEvents(int numEvents){ return _SDL_RegisterEvents(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_PumpEvents, here.SDL_PumpEvents.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_PeepEvents, here.SDL_PeepEvents.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasEvent, here.SDL_HasEvent.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HasEvents, here.SDL_HasEvents.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FlushEvent, here.SDL_FlushEvent.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FlushEvents, here.SDL_FlushEvents.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_PollEvent, here.SDL_PollEvent.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WaitEvent, here.SDL_WaitEvent.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WaitEventTimeout, here.SDL_WaitEventTimeout.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_PushEvent, here.SDL_PushEvent.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetEventFilter, here.SDL_SetEventFilter.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetEventFilter, here.SDL_GetEventFilter.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AddEventWatch, here.SDL_AddEventWatch.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DelEventWatch, here.SDL_DelEventWatch.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FilterEvents, here.SDL_FilterEvents.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_EventState, here.SDL_EventState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RegisterEvents, here.SDL_RegisterEvents.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/filesystem.d(13,1)
private nothrow @nogc{
	alias _pSDL_GetBasePath = extern(C) char* function();
	alias _pSDL_GetPrefPath = extern(C) char* function(const(char)* org, const(char)* app);
}
__gshared nothrow @nogc{
	package _pSDL_GetBasePath _SDL_GetBasePath;
	extern(C) char* SDL_GetBasePath(){ return _SDL_GetBasePath(__traits(parameters)); }
	package _pSDL_GetPrefPath _SDL_GetPrefPath;
	extern(C) char* SDL_GetPrefPath(const(char)* org, const(char)* app){ return _SDL_GetPrefPath(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetBasePath, here.SDL_GetBasePath.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetPrefPath, here.SDL_GetPrefPath.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/sensor.d(36,1)
private nothrow @nogc{
	alias _pSDL_NumSensors = extern(C) int function();
	alias _pSDL_SensorGetDeviceName = extern(C) const(char)* function(int deviceIndex);
	alias _pSDL_SensorGetDeviceType = extern(C) SDL_SensorType function(int deviceIndex);
	alias _pSDL_SensorGetDeviceNonPortableType = extern(C) int function(int deviceIndex);
	alias _pSDL_SensorGetDeviceInstanceID = extern(C) SDL_SensorID function(int deviceIndex);
	alias _pSDL_SensorOpen = extern(C) SDL_Sensor* function(int deviceIndex);
	alias _pSDL_SensorFromInstanceID = extern(C) SDL_Sensor* function(SDL_SensorID instanceID);
	alias _pSDL_SensorGetName = extern(C) const(char)* function(SDL_Sensor* sensor);
	alias _pSDL_SensorGetType = extern(C) SDL_SensorType function(SDL_Sensor* sensor);
	alias _pSDL_SensorGetNonPortableType = extern(C) int function(SDL_Sensor* sensor);
	alias _pSDL_SensorGetData = extern(C) int function(SDL_Sensor* sensor, float* data, int numValues);
	alias _pSDL_SensorClose = extern(C) void function(SDL_Sensor* sensor);
	alias _pSDL_SensorUpdate = extern(C) void function();
	alias _pSDL_LockSensors = extern(C) void function();
	alias _pSDL_UnlockSensors = extern(C) void function();
	alias _pSDL_SensorGetDataWithTimestamp = extern(C) int function(SDL_Sensor* sensor, ulong* timestamp, float* data, int numValues);
}
__gshared nothrow @nogc{
	package _pSDL_NumSensors _SDL_NumSensors;
	extern(C) int SDL_NumSensors(){ return _SDL_NumSensors(__traits(parameters)); }
	package _pSDL_SensorGetDeviceName _SDL_SensorGetDeviceName;
	extern(C) const(char)* SDL_SensorGetDeviceName(int deviceIndex){ return _SDL_SensorGetDeviceName(__traits(parameters)); }
	package _pSDL_SensorGetDeviceType _SDL_SensorGetDeviceType;
	extern(C) SDL_SensorType SDL_SensorGetDeviceType(int deviceIndex){ return _SDL_SensorGetDeviceType(__traits(parameters)); }
	package _pSDL_SensorGetDeviceNonPortableType _SDL_SensorGetDeviceNonPortableType;
	extern(C) int SDL_SensorGetDeviceNonPortableType(int deviceIndex){ return _SDL_SensorGetDeviceNonPortableType(__traits(parameters)); }
	package _pSDL_SensorGetDeviceInstanceID _SDL_SensorGetDeviceInstanceID;
	extern(C) SDL_SensorID SDL_SensorGetDeviceInstanceID(int deviceIndex){ return _SDL_SensorGetDeviceInstanceID(__traits(parameters)); }
	package _pSDL_SensorOpen _SDL_SensorOpen;
	extern(C) SDL_Sensor* SDL_SensorOpen(int deviceIndex){ return _SDL_SensorOpen(__traits(parameters)); }
	package _pSDL_SensorFromInstanceID _SDL_SensorFromInstanceID;
	extern(C) SDL_Sensor* SDL_SensorFromInstanceID(SDL_SensorID instanceID){ return _SDL_SensorFromInstanceID(__traits(parameters)); }
	package _pSDL_SensorGetName _SDL_SensorGetName;
	extern(C) const(char)* SDL_SensorGetName(SDL_Sensor* sensor){ return _SDL_SensorGetName(__traits(parameters)); }
	package _pSDL_SensorGetType _SDL_SensorGetType;
	extern(C) SDL_SensorType SDL_SensorGetType(SDL_Sensor* sensor){ return _SDL_SensorGetType(__traits(parameters)); }
	package _pSDL_SensorGetNonPortableType _SDL_SensorGetNonPortableType;
	extern(C) int SDL_SensorGetNonPortableType(SDL_Sensor* sensor){ return _SDL_SensorGetNonPortableType(__traits(parameters)); }
	package _pSDL_SensorGetData _SDL_SensorGetData;
	extern(C) int SDL_SensorGetData(SDL_Sensor* sensor, float* data, int numValues){ return _SDL_SensorGetData(__traits(parameters)); }
	package _pSDL_SensorClose _SDL_SensorClose;
	extern(C) void SDL_SensorClose(SDL_Sensor* sensor){ _SDL_SensorClose(__traits(parameters)); }
	package _pSDL_SensorUpdate _SDL_SensorUpdate;
	extern(C) void SDL_SensorUpdate(){ _SDL_SensorUpdate(__traits(parameters)); }
	package _pSDL_LockSensors _SDL_LockSensors;
	extern(C) void SDL_LockSensors(){ _SDL_LockSensors(__traits(parameters)); }
	package _pSDL_UnlockSensors _SDL_UnlockSensors;
	extern(C) void SDL_UnlockSensors(){ _SDL_UnlockSensors(__traits(parameters)); }
	package _pSDL_SensorGetDataWithTimestamp _SDL_SensorGetDataWithTimestamp;
	extern(C) int SDL_SensorGetDataWithTimestamp(SDL_Sensor* sensor, ulong* timestamp, float* data, int numValues){ return _SDL_SensorGetDataWithTimestamp(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_NumSensors, here.SDL_NumSensors.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetDeviceName, here.SDL_SensorGetDeviceName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetDeviceType, here.SDL_SensorGetDeviceType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetDeviceNonPortableType, here.SDL_SensorGetDeviceNonPortableType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetDeviceInstanceID, here.SDL_SensorGetDeviceInstanceID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorOpen, here.SDL_SensorOpen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorFromInstanceID, here.SDL_SensorFromInstanceID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetName, here.SDL_SensorGetName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetType, here.SDL_SensorGetType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetNonPortableType, here.SDL_SensorGetNonPortableType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetData, here.SDL_SensorGetData.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorClose, here.SDL_SensorClose.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorUpdate, here.SDL_SensorUpdate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockSensors, here.SDL_LockSensors.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnlockSensors, here.SDL_UnlockSensors.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SensorGetDataWithTimestamp, here.SDL_SensorGetDataWithTimestamp.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/gamecontroller.d(127,1)
private nothrow @nogc{
	alias _pSDL_GameControllerAddMapping = extern(C) int function(const(char)* mappingString);
	alias _pSDL_GameControllerMappingForGUID = extern(C) char* function(SDL_JoystickGUID guid);
	alias _pSDL_GameControllerMapping = extern(C) char* function(SDL_GameController* gameController);
	alias _pSDL_IsGameController = extern(C) SDL_bool function(int joystickIndex);
	alias _pSDL_GameControllerNameForIndex = extern(C) const(char)* function(int joystickIndex);
	alias _pSDL_GameControllerOpen = extern(C) SDL_GameController* function(int joystickIndex);
	alias _pSDL_GameControllerName = extern(C) const(char)* function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetAttached = extern(C) SDL_bool function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetJoystick = extern(C) SDL_Joystick* function(SDL_GameController* gameController);
	alias _pSDL_GameControllerEventState = extern(C) int function(int state);
	alias _pSDL_GameControllerUpdate = extern(C) void function();
	alias _pSDL_GameControllerGetAxisFromString = extern(C) SDL_GameControllerAxis function(const(char)* pchString);
	alias _pSDL_GameControllerGetStringForAxis = extern(C) const(char)* function(SDL_GameControllerAxis axis);
	alias _pSDL_GameControllerGetBindForAxis = extern(C) SDL_GameControllerButtonBind function(SDL_GameController* gameController, SDL_GameControllerAxis axis);
	alias _pSDL_GameControllerGetAxis = extern(C) short function(SDL_GameController* gameController, SDL_GameControllerAxis axis);
	alias _pSDL_GameControllerGetButtonFromString = extern(C) SDL_GameControllerButton function(const(char*) pchString);
	alias _pSDL_GameControllerGetStringForButton = extern(C) const(char)* function(SDL_GameControllerButton button);
	alias _pSDL_GameControllerGetBindForButton = extern(C) SDL_GameControllerButtonBind function(SDL_GameController* gameController, SDL_GameControllerButton button);
	alias _pSDL_GameControllerGetButton = extern(C) ubyte function(SDL_GameController* gameController, SDL_GameControllerButton button);
	alias _pSDL_GameControllerClose = extern(C) void function(SDL_GameController* gameController);
	alias _pSDL_GameControllerAddMappingsFromRW = extern(C) int function(SDL_RWops* rw, int freeRW);
	alias _pSDL_GameControllerFromInstanceID = extern(C) SDL_GameController* function(SDL_JoystickID joyID);
	alias _pSDL_GameControllerGetProduct = extern(C) ushort function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetProductVersion = extern(C) ushort function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetVendor = extern(C) ushort function(SDL_GameController* gameController);
	alias _pSDL_GameControllerMappingForIndex = extern(C) char* function(int mappingIndex);
	alias _pSDL_GameControllerNumMappings = extern(C) int function();
	alias _pSDL_GameControllerMappingForDeviceIndex = extern(C) char* function(int joystickIndex);
	alias _pSDL_GameControllerRumble = extern(C) int function(SDL_GameController* gameController, ushort lowFrequencyRumble, ushort highFrequencyRumble, uint durationMS);
	alias _pSDL_GameControllerGetPlayerIndex = extern(C) int function(SDL_GameController* gameController);
	alias _pSDL_GameControllerTypeForIndex = extern(C) SDL_GameControllerType function(int joystickIndex);
	alias _pSDL_GameControllerFromPlayerIndex = extern(C) SDL_GameController* function(int playerIndex);
	alias _pSDL_GameControllerGetType = extern(C) SDL_GameControllerType function(SDL_GameController* gameController);
	alias _pSDL_GameControllerSetPlayerIndex = extern(C) void function(SDL_GameController* gameController, int playerIndex);
	alias _pSDL_GameControllerHasAxis = extern(C) SDL_bool function(SDL_GameController* gameController, SDL_GameControllerAxis axis);
	alias _pSDL_GameControllerHasButton = extern(C) SDL_bool function(SDL_GameController* gameController, SDL_GameControllerButton button);
	alias _pSDL_GameControllerGetNumTouchpads = extern(C) int function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetNumTouchpadFingers = extern(C) int function(SDL_GameController* gameController, int touchpad);
	alias _pSDL_GameControllerGetTouchpadFinger = extern(C) int function(SDL_GameController* gameController, int touchpad, int finger, ubyte* state, float* x, float* y, float* pressure);
	alias _pSDL_GameControllerHasSensor = extern(C) SDL_bool function(SDL_GameController* gameController, SDL_SensorType type);
	alias _pSDL_GameControllerSetSensorEnabled = extern(C) int function(SDL_GameController* gameController, SDL_SensorType type, SDL_bool enabled);
	alias _pSDL_GameControllerIsSensorEnabled = extern(C) SDL_bool function(SDL_GameController* gameController, SDL_SensorType type);
	alias _pSDL_GameControllerGetSensorData = extern(C) int function(SDL_GameController* gameController, SDL_SensorType type, float* data, int numValues);
	alias _pSDL_GameControllerRumbleTriggers = extern(C) int function(SDL_GameController* gameController, ushort leftRumble, ushort rightRumble, uint durationMS);
	alias _pSDL_GameControllerHasLED = extern(C) SDL_bool function(SDL_GameController* gameController);
	alias _pSDL_GameControllerSetLED = extern(C) int function(SDL_GameController* gameController, ubyte red, ubyte green, ubyte blue);
	alias _pSDL_GameControllerSendEffect = extern(C) int function(SDL_GameController* gameController, const(void)* data, int size);
	alias _pSDL_GameControllerGetSensorDataRate = extern(C) float function(SDL_GameController* gameController, SDL_SensorType type);
	alias _pSDL_GameControllerHasRumble = extern(C) SDL_bool function(SDL_GameController* gameController);
	alias _pSDL_GameControllerHasRumbleTriggers = extern(C) SDL_bool function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetAppleSFSymbolsNameForButton = extern(C) const(char)* function(SDL_GameController* gameController, SDL_GameControllerButton button);
	alias _pSDL_GameControllerGetAppleSFSymbolsNameForAxis = extern(C) const(char)* function(SDL_GameController* gameController, SDL_GameControllerAxis axis);
	alias _pSDL_GameControllerPathForIndex = extern(C) const(char)* function(int joystickIndex);
	alias _pSDL_GameControllerPath = extern(C) const(char)* function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetFirmwareVersion = extern(C) ushort function(SDL_GameController* gameController);
	alias _pSDL_GameControllerGetSensorDataWithTimestamp = extern(C) int function(SDL_GameController* gameController, SDL_SensorType type, ulong* timestamp, float* data, int numValues);
}
__gshared nothrow @nogc{
	package _pSDL_GameControllerAddMapping _SDL_GameControllerAddMapping;
	extern(C) int SDL_GameControllerAddMapping(const(char)* mappingString){ return _SDL_GameControllerAddMapping(__traits(parameters)); }
	package _pSDL_GameControllerMappingForGUID _SDL_GameControllerMappingForGUID;
	extern(C) char* SDL_GameControllerMappingForGUID(SDL_JoystickGUID guid){ return _SDL_GameControllerMappingForGUID(__traits(parameters)); }
	package _pSDL_GameControllerMapping _SDL_GameControllerMapping;
	extern(C) char* SDL_GameControllerMapping(SDL_GameController* gameController){ return _SDL_GameControllerMapping(__traits(parameters)); }
	package _pSDL_IsGameController _SDL_IsGameController;
	extern(C) SDL_bool SDL_IsGameController(int joystickIndex){ return _SDL_IsGameController(__traits(parameters)); }
	package _pSDL_GameControllerNameForIndex _SDL_GameControllerNameForIndex;
	extern(C) const(char)* SDL_GameControllerNameForIndex(int joystickIndex){ return _SDL_GameControllerNameForIndex(__traits(parameters)); }
	package _pSDL_GameControllerOpen _SDL_GameControllerOpen;
	extern(C) SDL_GameController* SDL_GameControllerOpen(int joystickIndex){ return _SDL_GameControllerOpen(__traits(parameters)); }
	package _pSDL_GameControllerName _SDL_GameControllerName;
	extern(C) const(char)* SDL_GameControllerName(SDL_GameController* gameController){ return _SDL_GameControllerName(__traits(parameters)); }
	package _pSDL_GameControllerGetAttached _SDL_GameControllerGetAttached;
	extern(C) SDL_bool SDL_GameControllerGetAttached(SDL_GameController* gameController){ return _SDL_GameControllerGetAttached(__traits(parameters)); }
	package _pSDL_GameControllerGetJoystick _SDL_GameControllerGetJoystick;
	extern(C) SDL_Joystick* SDL_GameControllerGetJoystick(SDL_GameController* gameController){ return _SDL_GameControllerGetJoystick(__traits(parameters)); }
	package _pSDL_GameControllerEventState _SDL_GameControllerEventState;
	extern(C) int SDL_GameControllerEventState(int state){ return _SDL_GameControllerEventState(__traits(parameters)); }
	package _pSDL_GameControllerUpdate _SDL_GameControllerUpdate;
	extern(C) void SDL_GameControllerUpdate(){ _SDL_GameControllerUpdate(__traits(parameters)); }
	package _pSDL_GameControllerGetAxisFromString _SDL_GameControllerGetAxisFromString;
	extern(C) SDL_GameControllerAxis SDL_GameControllerGetAxisFromString(const(char)* pchString){ return _SDL_GameControllerGetAxisFromString(__traits(parameters)); }
	package _pSDL_GameControllerGetStringForAxis _SDL_GameControllerGetStringForAxis;
	extern(C) const(char)* SDL_GameControllerGetStringForAxis(SDL_GameControllerAxis axis){ return _SDL_GameControllerGetStringForAxis(__traits(parameters)); }
	package _pSDL_GameControllerGetBindForAxis _SDL_GameControllerGetBindForAxis;
	extern(C) SDL_GameControllerButtonBind SDL_GameControllerGetBindForAxis(SDL_GameController* gameController, SDL_GameControllerAxis axis){ return _SDL_GameControllerGetBindForAxis(__traits(parameters)); }
	package _pSDL_GameControllerGetAxis _SDL_GameControllerGetAxis;
	extern(C) short SDL_GameControllerGetAxis(SDL_GameController* gameController, SDL_GameControllerAxis axis){ return _SDL_GameControllerGetAxis(__traits(parameters)); }
	package _pSDL_GameControllerGetButtonFromString _SDL_GameControllerGetButtonFromString;
	extern(C) SDL_GameControllerButton SDL_GameControllerGetButtonFromString(const(char*) pchString){ return _SDL_GameControllerGetButtonFromString(__traits(parameters)); }
	package _pSDL_GameControllerGetStringForButton _SDL_GameControllerGetStringForButton;
	extern(C) const(char)* SDL_GameControllerGetStringForButton(SDL_GameControllerButton button){ return _SDL_GameControllerGetStringForButton(__traits(parameters)); }
	package _pSDL_GameControllerGetBindForButton _SDL_GameControllerGetBindForButton;
	extern(C) SDL_GameControllerButtonBind SDL_GameControllerGetBindForButton(SDL_GameController* gameController, SDL_GameControllerButton button){ return _SDL_GameControllerGetBindForButton(__traits(parameters)); }
	package _pSDL_GameControllerGetButton _SDL_GameControllerGetButton;
	extern(C) ubyte SDL_GameControllerGetButton(SDL_GameController* gameController, SDL_GameControllerButton button){ return _SDL_GameControllerGetButton(__traits(parameters)); }
	package _pSDL_GameControllerClose _SDL_GameControllerClose;
	extern(C) void SDL_GameControllerClose(SDL_GameController* gameController){ _SDL_GameControllerClose(__traits(parameters)); }
	package _pSDL_GameControllerAddMappingsFromRW _SDL_GameControllerAddMappingsFromRW;
	extern(C) int SDL_GameControllerAddMappingsFromRW(SDL_RWops* rw, int freeRW){ return _SDL_GameControllerAddMappingsFromRW(__traits(parameters)); }
	package _pSDL_GameControllerFromInstanceID _SDL_GameControllerFromInstanceID;
	extern(C) SDL_GameController* SDL_GameControllerFromInstanceID(SDL_JoystickID joyID){ return _SDL_GameControllerFromInstanceID(__traits(parameters)); }
	package _pSDL_GameControllerGetProduct _SDL_GameControllerGetProduct;
	extern(C) ushort SDL_GameControllerGetProduct(SDL_GameController* gameController){ return _SDL_GameControllerGetProduct(__traits(parameters)); }
	package _pSDL_GameControllerGetProductVersion _SDL_GameControllerGetProductVersion;
	extern(C) ushort SDL_GameControllerGetProductVersion(SDL_GameController* gameController){ return _SDL_GameControllerGetProductVersion(__traits(parameters)); }
	package _pSDL_GameControllerGetVendor _SDL_GameControllerGetVendor;
	extern(C) ushort SDL_GameControllerGetVendor(SDL_GameController* gameController){ return _SDL_GameControllerGetVendor(__traits(parameters)); }
	package _pSDL_GameControllerMappingForIndex _SDL_GameControllerMappingForIndex;
	extern(C) char* SDL_GameControllerMappingForIndex(int mappingIndex){ return _SDL_GameControllerMappingForIndex(__traits(parameters)); }
	package _pSDL_GameControllerNumMappings _SDL_GameControllerNumMappings;
	extern(C) int SDL_GameControllerNumMappings(){ return _SDL_GameControllerNumMappings(__traits(parameters)); }
	package _pSDL_GameControllerMappingForDeviceIndex _SDL_GameControllerMappingForDeviceIndex;
	extern(C) char* SDL_GameControllerMappingForDeviceIndex(int joystickIndex){ return _SDL_GameControllerMappingForDeviceIndex(__traits(parameters)); }
	package _pSDL_GameControllerRumble _SDL_GameControllerRumble;
	extern(C) int SDL_GameControllerRumble(SDL_GameController* gameController, ushort lowFrequencyRumble, ushort highFrequencyRumble, uint durationMS){ return _SDL_GameControllerRumble(__traits(parameters)); }
	package _pSDL_GameControllerGetPlayerIndex _SDL_GameControllerGetPlayerIndex;
	extern(C) int SDL_GameControllerGetPlayerIndex(SDL_GameController* gameController){ return _SDL_GameControllerGetPlayerIndex(__traits(parameters)); }
	package _pSDL_GameControllerTypeForIndex _SDL_GameControllerTypeForIndex;
	extern(C) SDL_GameControllerType SDL_GameControllerTypeForIndex(int joystickIndex){ return _SDL_GameControllerTypeForIndex(__traits(parameters)); }
	package _pSDL_GameControllerFromPlayerIndex _SDL_GameControllerFromPlayerIndex;
	extern(C) SDL_GameController* SDL_GameControllerFromPlayerIndex(int playerIndex){ return _SDL_GameControllerFromPlayerIndex(__traits(parameters)); }
	package _pSDL_GameControllerGetType _SDL_GameControllerGetType;
	extern(C) SDL_GameControllerType SDL_GameControllerGetType(SDL_GameController* gameController){ return _SDL_GameControllerGetType(__traits(parameters)); }
	package _pSDL_GameControllerSetPlayerIndex _SDL_GameControllerSetPlayerIndex;
	extern(C) void SDL_GameControllerSetPlayerIndex(SDL_GameController* gameController, int playerIndex){ _SDL_GameControllerSetPlayerIndex(__traits(parameters)); }
	package _pSDL_GameControllerHasAxis _SDL_GameControllerHasAxis;
	extern(C) SDL_bool SDL_GameControllerHasAxis(SDL_GameController* gameController, SDL_GameControllerAxis axis){ return _SDL_GameControllerHasAxis(__traits(parameters)); }
	package _pSDL_GameControllerHasButton _SDL_GameControllerHasButton;
	extern(C) SDL_bool SDL_GameControllerHasButton(SDL_GameController* gameController, SDL_GameControllerButton button){ return _SDL_GameControllerHasButton(__traits(parameters)); }
	package _pSDL_GameControllerGetNumTouchpads _SDL_GameControllerGetNumTouchpads;
	extern(C) int SDL_GameControllerGetNumTouchpads(SDL_GameController* gameController){ return _SDL_GameControllerGetNumTouchpads(__traits(parameters)); }
	package _pSDL_GameControllerGetNumTouchpadFingers _SDL_GameControllerGetNumTouchpadFingers;
	extern(C) int SDL_GameControllerGetNumTouchpadFingers(SDL_GameController* gameController, int touchpad){ return _SDL_GameControllerGetNumTouchpadFingers(__traits(parameters)); }
	package _pSDL_GameControllerGetTouchpadFinger _SDL_GameControllerGetTouchpadFinger;
	extern(C) int SDL_GameControllerGetTouchpadFinger(SDL_GameController* gameController, int touchpad, int finger, ubyte* state, float* x, float* y, float* pressure){ return _SDL_GameControllerGetTouchpadFinger(__traits(parameters)); }
	package _pSDL_GameControllerHasSensor _SDL_GameControllerHasSensor;
	extern(C) SDL_bool SDL_GameControllerHasSensor(SDL_GameController* gameController, SDL_SensorType type){ return _SDL_GameControllerHasSensor(__traits(parameters)); }
	package _pSDL_GameControllerSetSensorEnabled _SDL_GameControllerSetSensorEnabled;
	extern(C) int SDL_GameControllerSetSensorEnabled(SDL_GameController* gameController, SDL_SensorType type, SDL_bool enabled){ return _SDL_GameControllerSetSensorEnabled(__traits(parameters)); }
	package _pSDL_GameControllerIsSensorEnabled _SDL_GameControllerIsSensorEnabled;
	extern(C) SDL_bool SDL_GameControllerIsSensorEnabled(SDL_GameController* gameController, SDL_SensorType type){ return _SDL_GameControllerIsSensorEnabled(__traits(parameters)); }
	package _pSDL_GameControllerGetSensorData _SDL_GameControllerGetSensorData;
	extern(C) int SDL_GameControllerGetSensorData(SDL_GameController* gameController, SDL_SensorType type, float* data, int numValues){ return _SDL_GameControllerGetSensorData(__traits(parameters)); }
	package _pSDL_GameControllerRumbleTriggers _SDL_GameControllerRumbleTriggers;
	extern(C) int SDL_GameControllerRumbleTriggers(SDL_GameController* gameController, ushort leftRumble, ushort rightRumble, uint durationMS){ return _SDL_GameControllerRumbleTriggers(__traits(parameters)); }
	package _pSDL_GameControllerHasLED _SDL_GameControllerHasLED;
	extern(C) SDL_bool SDL_GameControllerHasLED(SDL_GameController* gameController){ return _SDL_GameControllerHasLED(__traits(parameters)); }
	package _pSDL_GameControllerSetLED _SDL_GameControllerSetLED;
	extern(C) int SDL_GameControllerSetLED(SDL_GameController* gameController, ubyte red, ubyte green, ubyte blue){ return _SDL_GameControllerSetLED(__traits(parameters)); }
	package _pSDL_GameControllerSendEffect _SDL_GameControllerSendEffect;
	extern(C) int SDL_GameControllerSendEffect(SDL_GameController* gameController, const(void)* data, int size){ return _SDL_GameControllerSendEffect(__traits(parameters)); }
	package _pSDL_GameControllerGetSensorDataRate _SDL_GameControllerGetSensorDataRate;
	extern(C) float SDL_GameControllerGetSensorDataRate(SDL_GameController* gameController, SDL_SensorType type){ return _SDL_GameControllerGetSensorDataRate(__traits(parameters)); }
	package _pSDL_GameControllerHasRumble _SDL_GameControllerHasRumble;
	extern(C) SDL_bool SDL_GameControllerHasRumble(SDL_GameController* gameController){ return _SDL_GameControllerHasRumble(__traits(parameters)); }
	package _pSDL_GameControllerHasRumbleTriggers _SDL_GameControllerHasRumbleTriggers;
	extern(C) SDL_bool SDL_GameControllerHasRumbleTriggers(SDL_GameController* gameController){ return _SDL_GameControllerHasRumbleTriggers(__traits(parameters)); }
	package _pSDL_GameControllerGetAppleSFSymbolsNameForButton _SDL_GameControllerGetAppleSFSymbolsNameForButton;
	extern(C) const(char)* SDL_GameControllerGetAppleSFSymbolsNameForButton(SDL_GameController* gameController, SDL_GameControllerButton button){ return _SDL_GameControllerGetAppleSFSymbolsNameForButton(__traits(parameters)); }
	package _pSDL_GameControllerGetAppleSFSymbolsNameForAxis _SDL_GameControllerGetAppleSFSymbolsNameForAxis;
	extern(C) const(char)* SDL_GameControllerGetAppleSFSymbolsNameForAxis(SDL_GameController* gameController, SDL_GameControllerAxis axis){ return _SDL_GameControllerGetAppleSFSymbolsNameForAxis(__traits(parameters)); }
	package _pSDL_GameControllerPathForIndex _SDL_GameControllerPathForIndex;
	extern(C) const(char)* SDL_GameControllerPathForIndex(int joystickIndex){ return _SDL_GameControllerPathForIndex(__traits(parameters)); }
	package _pSDL_GameControllerPath _SDL_GameControllerPath;
	extern(C) const(char)* SDL_GameControllerPath(SDL_GameController* gameController){ return _SDL_GameControllerPath(__traits(parameters)); }
	package _pSDL_GameControllerGetFirmwareVersion _SDL_GameControllerGetFirmwareVersion;
	extern(C) ushort SDL_GameControllerGetFirmwareVersion(SDL_GameController* gameController){ return _SDL_GameControllerGetFirmwareVersion(__traits(parameters)); }
	package _pSDL_GameControllerGetSensorDataWithTimestamp _SDL_GameControllerGetSensorDataWithTimestamp;
	extern(C) int SDL_GameControllerGetSensorDataWithTimestamp(SDL_GameController* gameController, SDL_SensorType type, ulong* timestamp, float* data, int numValues){ return _SDL_GameControllerGetSensorDataWithTimestamp(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GameControllerAddMapping, here.SDL_GameControllerAddMapping.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerMappingForGUID, here.SDL_GameControllerMappingForGUID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerMapping, here.SDL_GameControllerMapping.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IsGameController, here.SDL_IsGameController.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerNameForIndex, here.SDL_GameControllerNameForIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerOpen, here.SDL_GameControllerOpen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerName, here.SDL_GameControllerName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetAttached, here.SDL_GameControllerGetAttached.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetJoystick, here.SDL_GameControllerGetJoystick.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerEventState, here.SDL_GameControllerEventState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerUpdate, here.SDL_GameControllerUpdate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetAxisFromString, here.SDL_GameControllerGetAxisFromString.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetStringForAxis, here.SDL_GameControllerGetStringForAxis.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetBindForAxis, here.SDL_GameControllerGetBindForAxis.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetAxis, here.SDL_GameControllerGetAxis.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetButtonFromString, here.SDL_GameControllerGetButtonFromString.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetStringForButton, here.SDL_GameControllerGetStringForButton.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetBindForButton, here.SDL_GameControllerGetBindForButton.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetButton, here.SDL_GameControllerGetButton.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerClose, here.SDL_GameControllerClose.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerAddMappingsFromRW, here.SDL_GameControllerAddMappingsFromRW.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerFromInstanceID, here.SDL_GameControllerFromInstanceID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetProduct, here.SDL_GameControllerGetProduct.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetProductVersion, here.SDL_GameControllerGetProductVersion.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetVendor, here.SDL_GameControllerGetVendor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerMappingForIndex, here.SDL_GameControllerMappingForIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerNumMappings, here.SDL_GameControllerNumMappings.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerMappingForDeviceIndex, here.SDL_GameControllerMappingForDeviceIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerRumble, here.SDL_GameControllerRumble.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetPlayerIndex, here.SDL_GameControllerGetPlayerIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerTypeForIndex, here.SDL_GameControllerTypeForIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerFromPlayerIndex, here.SDL_GameControllerFromPlayerIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetType, here.SDL_GameControllerGetType.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerSetPlayerIndex, here.SDL_GameControllerSetPlayerIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerHasAxis, here.SDL_GameControllerHasAxis.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerHasButton, here.SDL_GameControllerHasButton.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetNumTouchpads, here.SDL_GameControllerGetNumTouchpads.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetNumTouchpadFingers, here.SDL_GameControllerGetNumTouchpadFingers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetTouchpadFinger, here.SDL_GameControllerGetTouchpadFinger.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerHasSensor, here.SDL_GameControllerHasSensor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerSetSensorEnabled, here.SDL_GameControllerSetSensorEnabled.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerIsSensorEnabled, here.SDL_GameControllerIsSensorEnabled.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetSensorData, here.SDL_GameControllerGetSensorData.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerRumbleTriggers, here.SDL_GameControllerRumbleTriggers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerHasLED, here.SDL_GameControllerHasLED.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerSetLED, here.SDL_GameControllerSetLED.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerSendEffect, here.SDL_GameControllerSendEffect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetSensorDataRate, here.SDL_GameControllerGetSensorDataRate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerHasRumble, here.SDL_GameControllerHasRumble.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerHasRumbleTriggers, here.SDL_GameControllerHasRumbleTriggers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetAppleSFSymbolsNameForButton, here.SDL_GameControllerGetAppleSFSymbolsNameForButton.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetAppleSFSymbolsNameForAxis, here.SDL_GameControllerGetAppleSFSymbolsNameForAxis.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerPathForIndex, here.SDL_GameControllerPathForIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerPath, here.SDL_GameControllerPath.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetFirmwareVersion, here.SDL_GameControllerGetFirmwareVersion.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GameControllerGetSensorDataWithTimestamp, here.SDL_GameControllerGetSensorDataWithTimestamp.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/hidapi.d(36,1)
private nothrow @nogc{
	alias _pSDL_hid_init = extern(C) int function();
	alias _pSDL_hid_exit = extern(C) int function();
	alias _pSDL_hid_device_change_count = extern(C) uint function();
	alias _pSDL_hid_enumerate = extern(C) SDL_hid_device_info* function(ushort vendorID, ushort productID);
	alias _pSDL_hid_free_enumeration = extern(C) void function(SDL_hid_device_info* devs);
	alias _pSDL_hid_open = extern(C) SDL_hid_device* function(ushort vendorID, ushort productID, const(wchar_t)* serialNumber);
	alias _pSDL_hid_open_path = extern(C) SDL_hid_device* function(const(char)* path, int bExclusive=false);
	alias _pSDL_hid_write = extern(C) int function(SDL_hid_device* dev, const(ubyte*) data, size_t length);
	alias _pSDL_hid_read_timeout = extern(C) int function(SDL_hid_device* dev, ubyte* data, size_t length, int milliseconds);
	alias _pSDL_hid_read = extern(C) int function(SDL_hid_device* dev, ubyte* data, size_t length);
	alias _pSDL_hid_set_nonblocking = extern(C) int function(SDL_hid_device* dev, int nonBlock);
	alias _pSDL_hid_send_feature_report = extern(C) int function(SDL_hid_device* dev, const(ubyte)* data, size_t length);
	alias _pSDL_hid_get_feature_report = extern(C) int function(SDL_hid_device* dev, ubyte* data, size_t length);
	alias _pSDL_hid_get_manufacturer_string = extern(C) int function(SDL_hid_device* dev, wchar_t* string, size_t maxLen);
	alias _pSDL_hid_get_product_string = extern(C) int function(SDL_hid_device* dev, wchar_t* string, size_t maxLen);
	alias _pSDL_hid_get_serial_number_string = extern(C) int function(SDL_hid_device* dev, wchar_t* string, size_t maxLen);
	alias _pSDL_hid_get_indexed_string = extern(C) int function(SDL_hid_device* dev, int stringIndex, wchar_t* string, size_t maxLen);
	alias _pSDL_hid_ble_scan = extern(C) void function(SDL_bool active);
}
__gshared nothrow @nogc{
	package _pSDL_hid_init _SDL_hid_init;
	extern(C) int SDL_hid_init(){ return _SDL_hid_init(__traits(parameters)); }
	package _pSDL_hid_exit _SDL_hid_exit;
	extern(C) int SDL_hid_exit(){ return _SDL_hid_exit(__traits(parameters)); }
	package _pSDL_hid_device_change_count _SDL_hid_device_change_count;
	extern(C) uint SDL_hid_device_change_count(){ return _SDL_hid_device_change_count(__traits(parameters)); }
	package _pSDL_hid_enumerate _SDL_hid_enumerate;
	extern(C) SDL_hid_device_info* SDL_hid_enumerate(ushort vendorID, ushort productID){ return _SDL_hid_enumerate(__traits(parameters)); }
	package _pSDL_hid_free_enumeration _SDL_hid_free_enumeration;
	extern(C) void SDL_hid_free_enumeration(SDL_hid_device_info* devs){ _SDL_hid_free_enumeration(__traits(parameters)); }
	package _pSDL_hid_open _SDL_hid_open;
	extern(C) SDL_hid_device* SDL_hid_open(ushort vendorID, ushort productID, const(wchar_t)* serialNumber){ return _SDL_hid_open(__traits(parameters)); }
	package _pSDL_hid_open_path _SDL_hid_open_path;
	extern(C) SDL_hid_device* SDL_hid_open_path(const(char)* path, int bExclusive=false){ return _SDL_hid_open_path(__traits(parameters)); }
	package _pSDL_hid_write _SDL_hid_write;
	extern(C) int SDL_hid_write(SDL_hid_device* dev, const(ubyte*) data, size_t length){ return _SDL_hid_write(__traits(parameters)); }
	package _pSDL_hid_read_timeout _SDL_hid_read_timeout;
	extern(C) int SDL_hid_read_timeout(SDL_hid_device* dev, ubyte* data, size_t length, int milliseconds){ return _SDL_hid_read_timeout(__traits(parameters)); }
	package _pSDL_hid_read _SDL_hid_read;
	extern(C) int SDL_hid_read(SDL_hid_device* dev, ubyte* data, size_t length){ return _SDL_hid_read(__traits(parameters)); }
	package _pSDL_hid_set_nonblocking _SDL_hid_set_nonblocking;
	extern(C) int SDL_hid_set_nonblocking(SDL_hid_device* dev, int nonBlock){ return _SDL_hid_set_nonblocking(__traits(parameters)); }
	package _pSDL_hid_send_feature_report _SDL_hid_send_feature_report;
	extern(C) int SDL_hid_send_feature_report(SDL_hid_device* dev, const(ubyte)* data, size_t length){ return _SDL_hid_send_feature_report(__traits(parameters)); }
	package _pSDL_hid_get_feature_report _SDL_hid_get_feature_report;
	extern(C) int SDL_hid_get_feature_report(SDL_hid_device* dev, ubyte* data, size_t length){ return _SDL_hid_get_feature_report(__traits(parameters)); }
	package _pSDL_hid_get_manufacturer_string _SDL_hid_get_manufacturer_string;
	extern(C) int SDL_hid_get_manufacturer_string(SDL_hid_device* dev, wchar_t* string, size_t maxLen){ return _SDL_hid_get_manufacturer_string(__traits(parameters)); }
	package _pSDL_hid_get_product_string _SDL_hid_get_product_string;
	extern(C) int SDL_hid_get_product_string(SDL_hid_device* dev, wchar_t* string, size_t maxLen){ return _SDL_hid_get_product_string(__traits(parameters)); }
	package _pSDL_hid_get_serial_number_string _SDL_hid_get_serial_number_string;
	extern(C) int SDL_hid_get_serial_number_string(SDL_hid_device* dev, wchar_t* string, size_t maxLen){ return _SDL_hid_get_serial_number_string(__traits(parameters)); }
	package _pSDL_hid_get_indexed_string _SDL_hid_get_indexed_string;
	extern(C) int SDL_hid_get_indexed_string(SDL_hid_device* dev, int stringIndex, wchar_t* string, size_t maxLen){ return _SDL_hid_get_indexed_string(__traits(parameters)); }
	package _pSDL_hid_ble_scan _SDL_hid_ble_scan;
	extern(C) void SDL_hid_ble_scan(SDL_bool active){ _SDL_hid_ble_scan(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_hid_init, here.SDL_hid_init.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_exit, here.SDL_hid_exit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_device_change_count, here.SDL_hid_device_change_count.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_enumerate, here.SDL_hid_enumerate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_free_enumeration, here.SDL_hid_free_enumeration.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_open, here.SDL_hid_open.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_open_path, here.SDL_hid_open_path.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_write, here.SDL_hid_write.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_read_timeout, here.SDL_hid_read_timeout.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_read, here.SDL_hid_read.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_set_nonblocking, here.SDL_hid_set_nonblocking.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_send_feature_report, here.SDL_hid_send_feature_report.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_get_feature_report, here.SDL_hid_get_feature_report.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_get_manufacturer_string, here.SDL_hid_get_manufacturer_string.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_get_product_string, here.SDL_hid_get_product_string.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_get_serial_number_string, here.SDL_hid_get_serial_number_string.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_get_indexed_string, here.SDL_hid_get_indexed_string.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_hid_ble_scan, here.SDL_hid_ble_scan.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/haptic.d(168,1)
private nothrow @nogc{
	alias _pSDL_NumHaptics = extern(C) int function();
	alias _pSDL_HapticName = extern(C) const(char)* function(int deviceIndex);
	alias _pSDL_HapticOpen = extern(C) SDL_Haptic* function(int deviceIndex);
	alias _pSDL_HapticOpened = extern(C) int function(int deviceIndex);
	alias _pSDL_HapticIndex = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_MouseIsHaptic = extern(C) int function();
	alias _pSDL_HapticOpenFromMouse = extern(C) SDL_Haptic* function();
	alias _pSDL_JoystickIsHaptic = extern(C) int function(SDL_Joystick* joystick);
	alias _pSDL_HapticOpenFromJoystick = extern(C) SDL_Haptic* function(SDL_Joystick* joystick);
	alias _pSDL_HapticClose = extern(C) void function(SDL_Haptic* haptic);
	alias _pSDL_HapticNumEffects = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticNumEffectsPlaying = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticQuery = extern(C) uint function(SDL_Haptic* haptic);
	alias _pSDL_HapticNumAxes = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticEffectSupported = extern(C) int function(SDL_Haptic* haptic, SDL_HapticEffect* effect);
	alias _pSDL_HapticNewEffect = extern(C) int function(SDL_Haptic* haptic, SDL_HapticEffect* effect);
	alias _pSDL_HapticUpdateEffect = extern(C) int function(SDL_Haptic* haptic, int effect, SDL_HapticEffect* data);
	alias _pSDL_HapticRunEffect = extern(C) int function(SDL_Haptic* haptic, int effect, uint iterations);
	alias _pSDL_HapticStopEffect = extern(C) int function(SDL_Haptic* haptic, int effect);
	alias _pSDL_HapticDestroyEffect = extern(C) int function(SDL_Haptic* haptic, int effect);
	alias _pSDL_HapticGetEffectStatus = extern(C) int function(SDL_Haptic* haptic, int effect);
	alias _pSDL_HapticSetGain = extern(C) int function(SDL_Haptic* haptic, int gain);
	alias _pSDL_HapticSetAutocenter = extern(C) int function(SDL_Haptic* haptic, int autocentre);
	alias _pSDL_HapticPause = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticUnpause = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticStopAll = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticRumbleSupported = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticRumbleInit = extern(C) int function(SDL_Haptic* haptic);
	alias _pSDL_HapticRumblePlay = extern(C) int function(SDL_Haptic* haptic, float strength, uint length);
	alias _pSDL_HapticRumbleStop = extern(C) int function(SDL_Haptic* haptic);
}
__gshared nothrow @nogc{
	package _pSDL_NumHaptics _SDL_NumHaptics;
	extern(C) int SDL_NumHaptics(){ return _SDL_NumHaptics(__traits(parameters)); }
	package _pSDL_HapticName _SDL_HapticName;
	extern(C) const(char)* SDL_HapticName(int deviceIndex){ return _SDL_HapticName(__traits(parameters)); }
	package _pSDL_HapticOpen _SDL_HapticOpen;
	extern(C) SDL_Haptic* SDL_HapticOpen(int deviceIndex){ return _SDL_HapticOpen(__traits(parameters)); }
	package _pSDL_HapticOpened _SDL_HapticOpened;
	extern(C) int SDL_HapticOpened(int deviceIndex){ return _SDL_HapticOpened(__traits(parameters)); }
	package _pSDL_HapticIndex _SDL_HapticIndex;
	extern(C) int SDL_HapticIndex(SDL_Haptic* haptic){ return _SDL_HapticIndex(__traits(parameters)); }
	package _pSDL_MouseIsHaptic _SDL_MouseIsHaptic;
	extern(C) int SDL_MouseIsHaptic(){ return _SDL_MouseIsHaptic(__traits(parameters)); }
	package _pSDL_HapticOpenFromMouse _SDL_HapticOpenFromMouse;
	extern(C) SDL_Haptic* SDL_HapticOpenFromMouse(){ return _SDL_HapticOpenFromMouse(__traits(parameters)); }
	package _pSDL_JoystickIsHaptic _SDL_JoystickIsHaptic;
	extern(C) int SDL_JoystickIsHaptic(SDL_Joystick* joystick){ return _SDL_JoystickIsHaptic(__traits(parameters)); }
	package _pSDL_HapticOpenFromJoystick _SDL_HapticOpenFromJoystick;
	extern(C) SDL_Haptic* SDL_HapticOpenFromJoystick(SDL_Joystick* joystick){ return _SDL_HapticOpenFromJoystick(__traits(parameters)); }
	package _pSDL_HapticClose _SDL_HapticClose;
	extern(C) void SDL_HapticClose(SDL_Haptic* haptic){ _SDL_HapticClose(__traits(parameters)); }
	package _pSDL_HapticNumEffects _SDL_HapticNumEffects;
	extern(C) int SDL_HapticNumEffects(SDL_Haptic* haptic){ return _SDL_HapticNumEffects(__traits(parameters)); }
	package _pSDL_HapticNumEffectsPlaying _SDL_HapticNumEffectsPlaying;
	extern(C) int SDL_HapticNumEffectsPlaying(SDL_Haptic* haptic){ return _SDL_HapticNumEffectsPlaying(__traits(parameters)); }
	package _pSDL_HapticQuery _SDL_HapticQuery;
	extern(C) uint SDL_HapticQuery(SDL_Haptic* haptic){ return _SDL_HapticQuery(__traits(parameters)); }
	package _pSDL_HapticNumAxes _SDL_HapticNumAxes;
	extern(C) int SDL_HapticNumAxes(SDL_Haptic* haptic){ return _SDL_HapticNumAxes(__traits(parameters)); }
	package _pSDL_HapticEffectSupported _SDL_HapticEffectSupported;
	extern(C) int SDL_HapticEffectSupported(SDL_Haptic* haptic, SDL_HapticEffect* effect){ return _SDL_HapticEffectSupported(__traits(parameters)); }
	package _pSDL_HapticNewEffect _SDL_HapticNewEffect;
	extern(C) int SDL_HapticNewEffect(SDL_Haptic* haptic, SDL_HapticEffect* effect){ return _SDL_HapticNewEffect(__traits(parameters)); }
	package _pSDL_HapticUpdateEffect _SDL_HapticUpdateEffect;
	extern(C) int SDL_HapticUpdateEffect(SDL_Haptic* haptic, int effect, SDL_HapticEffect* data){ return _SDL_HapticUpdateEffect(__traits(parameters)); }
	package _pSDL_HapticRunEffect _SDL_HapticRunEffect;
	extern(C) int SDL_HapticRunEffect(SDL_Haptic* haptic, int effect, uint iterations){ return _SDL_HapticRunEffect(__traits(parameters)); }
	package _pSDL_HapticStopEffect _SDL_HapticStopEffect;
	extern(C) int SDL_HapticStopEffect(SDL_Haptic* haptic, int effect){ return _SDL_HapticStopEffect(__traits(parameters)); }
	package _pSDL_HapticDestroyEffect _SDL_HapticDestroyEffect;
	extern(C) int SDL_HapticDestroyEffect(SDL_Haptic* haptic, int effect){ return _SDL_HapticDestroyEffect(__traits(parameters)); }
	package _pSDL_HapticGetEffectStatus _SDL_HapticGetEffectStatus;
	extern(C) int SDL_HapticGetEffectStatus(SDL_Haptic* haptic, int effect){ return _SDL_HapticGetEffectStatus(__traits(parameters)); }
	package _pSDL_HapticSetGain _SDL_HapticSetGain;
	extern(C) int SDL_HapticSetGain(SDL_Haptic* haptic, int gain){ return _SDL_HapticSetGain(__traits(parameters)); }
	package _pSDL_HapticSetAutocenter _SDL_HapticSetAutocenter;
	extern(C) int SDL_HapticSetAutocenter(SDL_Haptic* haptic, int autocentre){ return _SDL_HapticSetAutocenter(__traits(parameters)); }
	package _pSDL_HapticPause _SDL_HapticPause;
	extern(C) int SDL_HapticPause(SDL_Haptic* haptic){ return _SDL_HapticPause(__traits(parameters)); }
	package _pSDL_HapticUnpause _SDL_HapticUnpause;
	extern(C) int SDL_HapticUnpause(SDL_Haptic* haptic){ return _SDL_HapticUnpause(__traits(parameters)); }
	package _pSDL_HapticStopAll _SDL_HapticStopAll;
	extern(C) int SDL_HapticStopAll(SDL_Haptic* haptic){ return _SDL_HapticStopAll(__traits(parameters)); }
	package _pSDL_HapticRumbleSupported _SDL_HapticRumbleSupported;
	extern(C) int SDL_HapticRumbleSupported(SDL_Haptic* haptic){ return _SDL_HapticRumbleSupported(__traits(parameters)); }
	package _pSDL_HapticRumbleInit _SDL_HapticRumbleInit;
	extern(C) int SDL_HapticRumbleInit(SDL_Haptic* haptic){ return _SDL_HapticRumbleInit(__traits(parameters)); }
	package _pSDL_HapticRumblePlay _SDL_HapticRumblePlay;
	extern(C) int SDL_HapticRumblePlay(SDL_Haptic* haptic, float strength, uint length){ return _SDL_HapticRumblePlay(__traits(parameters)); }
	package _pSDL_HapticRumbleStop _SDL_HapticRumbleStop;
	extern(C) int SDL_HapticRumbleStop(SDL_Haptic* haptic){ return _SDL_HapticRumbleStop(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_NumHaptics, here.SDL_NumHaptics.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticName, here.SDL_HapticName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticOpen, here.SDL_HapticOpen.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticOpened, here.SDL_HapticOpened.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticIndex, here.SDL_HapticIndex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_MouseIsHaptic, here.SDL_MouseIsHaptic.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticOpenFromMouse, here.SDL_HapticOpenFromMouse.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_JoystickIsHaptic, here.SDL_JoystickIsHaptic.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticOpenFromJoystick, here.SDL_HapticOpenFromJoystick.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticClose, here.SDL_HapticClose.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticNumEffects, here.SDL_HapticNumEffects.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticNumEffectsPlaying, here.SDL_HapticNumEffectsPlaying.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticQuery, here.SDL_HapticQuery.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticNumAxes, here.SDL_HapticNumAxes.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticEffectSupported, here.SDL_HapticEffectSupported.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticNewEffect, here.SDL_HapticNewEffect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticUpdateEffect, here.SDL_HapticUpdateEffect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticRunEffect, here.SDL_HapticRunEffect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticStopEffect, here.SDL_HapticStopEffect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticDestroyEffect, here.SDL_HapticDestroyEffect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticGetEffectStatus, here.SDL_HapticGetEffectStatus.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticSetGain, here.SDL_HapticSetGain.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticSetAutocenter, here.SDL_HapticSetAutocenter.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticPause, here.SDL_HapticPause.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticUnpause, here.SDL_HapticUnpause.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticStopAll, here.SDL_HapticStopAll.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticRumbleSupported, here.SDL_HapticRumbleSupported.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticRumbleInit, here.SDL_HapticRumbleInit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticRumblePlay, here.SDL_HapticRumblePlay.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_HapticRumbleStop, here.SDL_HapticRumbleStop.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/hints.d(278,1)
private nothrow @nogc{
	alias _pSDL_SetHintWithPriority = extern(C) SDL_bool function(const(char)* name, const(char)* value, SDL_HintPriority priority);
	alias _pSDL_SetHint = extern(C) SDL_bool function(const(char)* name, const(char)* value);
	alias _pSDL_GetHint = extern(C) const(char)* function(const(char)* name);
	alias _pSDL_AddHintCallback = extern(C) void function(const(char)* name, SDL_HintCallback callback, void* userData);
	alias _pSDL_DelHintCallback = extern(C) void function(const(char)* name, SDL_HintCallback callback, void* userData);
	alias _pSDL_ClearHints = extern(C) void function();
	alias _pSDL_GetHintBoolean = extern(C) SDL_bool function(const(char)* name, SDL_bool defaultValue);
	alias _pSDL_ResetHint = extern(C) SDL_bool function(const(char)* name);
	alias _pSDL_ResetHints = extern(C) void function();
}
__gshared nothrow @nogc{
	package _pSDL_SetHintWithPriority _SDL_SetHintWithPriority;
	extern(C) SDL_bool SDL_SetHintWithPriority(const(char)* name, const(char)* value, SDL_HintPriority priority){ return _SDL_SetHintWithPriority(__traits(parameters)); }
	package _pSDL_SetHint _SDL_SetHint;
	extern(C) SDL_bool SDL_SetHint(const(char)* name, const(char)* value){ return _SDL_SetHint(__traits(parameters)); }
	package _pSDL_GetHint _SDL_GetHint;
	extern(C) const(char)* SDL_GetHint(const(char)* name){ return _SDL_GetHint(__traits(parameters)); }
	package _pSDL_AddHintCallback _SDL_AddHintCallback;
	extern(C) void SDL_AddHintCallback(const(char)* name, SDL_HintCallback callback, void* userData){ _SDL_AddHintCallback(__traits(parameters)); }
	package _pSDL_DelHintCallback _SDL_DelHintCallback;
	extern(C) void SDL_DelHintCallback(const(char)* name, SDL_HintCallback callback, void* userData){ _SDL_DelHintCallback(__traits(parameters)); }
	package _pSDL_ClearHints _SDL_ClearHints;
	extern(C) void SDL_ClearHints(){ _SDL_ClearHints(__traits(parameters)); }
	package _pSDL_GetHintBoolean _SDL_GetHintBoolean;
	extern(C) SDL_bool SDL_GetHintBoolean(const(char)* name, SDL_bool defaultValue){ return _SDL_GetHintBoolean(__traits(parameters)); }
	package _pSDL_ResetHint _SDL_ResetHint;
	extern(C) SDL_bool SDL_ResetHint(const(char)* name){ return _SDL_ResetHint(__traits(parameters)); }
	package _pSDL_ResetHints _SDL_ResetHints;
	extern(C) void SDL_ResetHints(){ _SDL_ResetHints(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_SetHintWithPriority, here.SDL_SetHintWithPriority.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetHint, here.SDL_SetHint.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetHint, here.SDL_GetHint.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AddHintCallback, here.SDL_AddHintCallback.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DelHintCallback, here.SDL_DelHintCallback.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ClearHints, here.SDL_ClearHints.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetHintBoolean, here.SDL_GetHintBoolean.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ResetHint, here.SDL_ResetHint.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ResetHints, here.SDL_ResetHints.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/loadso.d(13,1)
private nothrow @nogc{
	alias _pSDL_LoadObject = extern(C) void* function(const(char)* soFile);
	alias _pSDL_LoadFunction = extern(C) void* function(void* handle,const(char*) name);
	alias _pSDL_UnloadObject = extern(C) void function(void* handle);
}
__gshared nothrow @nogc{
	package _pSDL_LoadObject _SDL_LoadObject;
	extern(C) void* SDL_LoadObject(const(char)* soFile){ return _SDL_LoadObject(__traits(parameters)); }
	package _pSDL_LoadFunction _SDL_LoadFunction;
	extern(C) void* SDL_LoadFunction(void* handle,const(char*) name){ return _SDL_LoadFunction(__traits(parameters)); }
	package _pSDL_UnloadObject _SDL_UnloadObject;
	extern(C) void SDL_UnloadObject(void* handle){ _SDL_UnloadObject(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_LoadObject, here.SDL_LoadObject.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LoadFunction, here.SDL_LoadFunction.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnloadObject, here.SDL_UnloadObject.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/locale.d(19,1)
private nothrow @nogc{
	alias _pSDL_GetPreferredLocales = extern(C) SDL_Locale* function();
}
__gshared nothrow @nogc{
	package _pSDL_GetPreferredLocales _SDL_GetPreferredLocales;
	extern(C) SDL_Locale* SDL_GetPreferredLocales(){ return _SDL_GetPreferredLocales(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetPreferredLocales, here.SDL_GetPreferredLocales.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/log.d(55,1)
private nothrow @nogc{
	alias _pSDL_LogSetAllPriority = extern(C) void function(SDL_LogPriority priority);
	alias _pSDL_LogSetPriority = extern(C) void function(int category, SDL_LogPriority priority);
	alias _pSDL_LogGetPriority = extern(C) SDL_LogPriority function(int category);
	alias _pSDL_LogResetPriorities = extern(C) void function();
	alias _pSDL_Log = extern(C) void function(const(char)* fmt, ...);
	alias _pSDL_LogVerbose = extern(C) void function(int category, const(char)* fmt, ...);
	alias _pSDL_LogDebug = extern(C) void function(int category, const(char)* fmt, ...);
	alias _pSDL_LogInfo = extern(C) void function(int category, const(char)* fmt, ...);
	alias _pSDL_LogWarn = extern(C) void function(int category, const(char)* fmt, ...);
	alias _pSDL_LogError = extern(C) void function(int category, const(char)* fmt, ...);
	alias _pSDL_LogCritical = extern(C) void function(int category, const(char)* fmt, ...);
	alias _pSDL_LogMessage = extern(C) void function(int category, SDL_LogPriority priority, const(char)* fmt, ...);
	alias _pSDL_LogMessageV = extern(C) void function(int category, SDL_LogPriority priority, const(char)* fmt, va_list ap);
	alias _pSDL_LogGetOutputFunction = extern(C) void function(SDL_LogOutputFunction callback, void** userData);
	alias _pSDL_LogSetOutputFunction = extern(C) void function(SDL_LogOutputFunction callback, void* userData);
}
__gshared nothrow @nogc{
	package _pSDL_LogSetAllPriority _SDL_LogSetAllPriority;
	extern(C) void SDL_LogSetAllPriority(SDL_LogPriority priority){ _SDL_LogSetAllPriority(__traits(parameters)); }
	package _pSDL_LogSetPriority _SDL_LogSetPriority;
	extern(C) void SDL_LogSetPriority(int category, SDL_LogPriority priority){ _SDL_LogSetPriority(__traits(parameters)); }
	package _pSDL_LogGetPriority _SDL_LogGetPriority;
	extern(C) SDL_LogPriority SDL_LogGetPriority(int category){ return _SDL_LogGetPriority(__traits(parameters)); }
	package _pSDL_LogResetPriorities _SDL_LogResetPriorities;
	extern(C) void SDL_LogResetPriorities(){ _SDL_LogResetPriorities(__traits(parameters)); }
	_pSDL_Log SDL_Log;
	_pSDL_LogVerbose SDL_LogVerbose;
	_pSDL_LogDebug SDL_LogDebug;
	_pSDL_LogInfo SDL_LogInfo;
	_pSDL_LogWarn SDL_LogWarn;
	_pSDL_LogError SDL_LogError;
	_pSDL_LogCritical SDL_LogCritical;
	_pSDL_LogMessage SDL_LogMessage;
	package _pSDL_LogMessageV _SDL_LogMessageV;
	extern(C) void SDL_LogMessageV(int category, SDL_LogPriority priority, const(char)* fmt, va_list ap){ _SDL_LogMessageV(__traits(parameters)); }
	package _pSDL_LogGetOutputFunction _SDL_LogGetOutputFunction;
	extern(C) void SDL_LogGetOutputFunction(SDL_LogOutputFunction callback, void** userData){ _SDL_LogGetOutputFunction(__traits(parameters)); }
	package _pSDL_LogSetOutputFunction _SDL_LogSetOutputFunction;
	extern(C) void SDL_LogSetOutputFunction(SDL_LogOutputFunction callback, void* userData){ _SDL_LogSetOutputFunction(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_LogSetAllPriority, here.SDL_LogSetAllPriority.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LogSetPriority, here.SDL_LogSetPriority.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LogGetPriority, here.SDL_LogGetPriority.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LogResetPriorities, here.SDL_LogResetPriorities.mangleof);
	lib.bindSymbol(cast(void**)&SDL_Log, "SDL_Log");
	lib.bindSymbol(cast(void**)&SDL_LogVerbose, "SDL_LogVerbose");
	lib.bindSymbol(cast(void**)&SDL_LogDebug, "SDL_LogDebug");
	lib.bindSymbol(cast(void**)&SDL_LogInfo, "SDL_LogInfo");
	lib.bindSymbol(cast(void**)&SDL_LogWarn, "SDL_LogWarn");
	lib.bindSymbol(cast(void**)&SDL_LogError, "SDL_LogError");
	lib.bindSymbol(cast(void**)&SDL_LogCritical, "SDL_LogCritical");
	lib.bindSymbol(cast(void**)&SDL_LogMessage, "SDL_LogMessage");
	lib.bindSymbol(cast(void**)&_SDL_LogMessageV, here.SDL_LogMessageV.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LogGetOutputFunction, here.SDL_LogGetOutputFunction.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LogSetOutputFunction, here.SDL_LogSetOutputFunction.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/messagebox.d(79,1)
private nothrow @nogc{
	alias _pSDL_ShowMessageBox = extern(C) int function(const(SDL_MessageBoxData)* messageBoxData, int* buttonID);
	alias _pSDL_ShowSimpleMessageBox = extern(C) int function(SDL_MessageBoxFlags flags, const(char)* title, const(char)* messsage, SDL_Window* window);
}
__gshared nothrow @nogc{
	package _pSDL_ShowMessageBox _SDL_ShowMessageBox;
	extern(C) int SDL_ShowMessageBox(const(SDL_MessageBoxData)* messageBoxData, int* buttonID){ return _SDL_ShowMessageBox(__traits(parameters)); }
	package _pSDL_ShowSimpleMessageBox _SDL_ShowSimpleMessageBox;
	extern(C) int SDL_ShowSimpleMessageBox(SDL_MessageBoxFlags flags, const(char)* title, const(char)* messsage, SDL_Window* window){ return _SDL_ShowSimpleMessageBox(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_ShowMessageBox, here.SDL_ShowMessageBox.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ShowSimpleMessageBox, here.SDL_ShowSimpleMessageBox.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/metal.d(16,1)
private nothrow @nogc{
	alias _pSDL_Metal_CreateView = extern(C) SDL_MetalView function(SDL_Window* window);
	alias _pSDL_Metal_DestroyView = extern(C) void function(SDL_MetalView view);
	alias _pSDL_Metal_GetLayer = extern(C) void* function(SDL_MetalView view);
	alias _pSDL_Metal_GetDrawableSize = extern(C) void function(SDL_Window* window, int* w, int* h);
}
__gshared nothrow @nogc{
	package _pSDL_Metal_CreateView _SDL_Metal_CreateView;
	extern(C) SDL_MetalView SDL_Metal_CreateView(SDL_Window* window){ return _SDL_Metal_CreateView(__traits(parameters)); }
	package _pSDL_Metal_DestroyView _SDL_Metal_DestroyView;
	extern(C) void SDL_Metal_DestroyView(SDL_MetalView view){ _SDL_Metal_DestroyView(__traits(parameters)); }
	package _pSDL_Metal_GetLayer _SDL_Metal_GetLayer;
	extern(C) void* SDL_Metal_GetLayer(SDL_MetalView view){ return _SDL_Metal_GetLayer(__traits(parameters)); }
	package _pSDL_Metal_GetDrawableSize _SDL_Metal_GetDrawableSize;
	extern(C) void SDL_Metal_GetDrawableSize(SDL_Window* window, int* w, int* h){ _SDL_Metal_GetDrawableSize(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_Metal_CreateView, here.SDL_Metal_CreateView.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Metal_DestroyView, here.SDL_Metal_DestroyView.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Metal_GetLayer, here.SDL_Metal_GetLayer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Metal_GetDrawableSize, here.SDL_Metal_GetDrawableSize.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/misc.d(13,1)
private nothrow @nogc{
	alias _pSDL_OpenURL = extern(C) int function(const(char)* url);
}
__gshared nothrow @nogc{
	package _pSDL_OpenURL _SDL_OpenURL;
	extern(C) int SDL_OpenURL(const(char)* url){ return _SDL_OpenURL(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_OpenURL, here.SDL_OpenURL.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/mouse.d(63,1)
private nothrow @nogc{
	alias _pSDL_GetMouseFocus = extern(C) SDL_Window* function();
	alias _pSDL_GetMouseState = extern(C) uint function(int* x, int* y);
	alias _pSDL_GetRelativeMouseState = extern(C) uint function(int* x, int* y);
	alias _pSDL_WarpMouseInWindow = extern(C) void function(SDL_Window* window, int x, int y);
	alias _pSDL_SetRelativeMouseMode = extern(C) int function(SDL_bool enabled);
	alias _pSDL_GetRelativeMouseMode = extern(C) SDL_bool function();
	alias _pSDL_CreateCursor = extern(C) SDL_Cursor* function(const(ubyte)* data, const(ubyte)* mask, int w, int h, int hotX, int hotY);
	alias _pSDL_CreateColorCursor = extern(C) SDL_Cursor* function(SDL_Surface* surface, int hotX, int hotY);
	alias _pSDL_CreateSystemCursor = extern(C) SDL_Cursor* function(SDL_SystemCursor id);
	alias _pSDL_SetCursor = extern(C) void function(SDL_Cursor* cursor);
	alias _pSDL_GetCursor = extern(C) SDL_Cursor* function();
	alias _pSDL_GetDefaultCursor = extern(C) SDL_Cursor* function();
	alias _pSDL_FreeCursor = extern(C) void function(SDL_Cursor* cursor);
	alias _pSDL_ShowCursor = extern(C) int function(int toggle);
	alias _pSDL_CaptureMouse = extern(C) int function(SDL_bool enabled);
	alias _pSDL_GetGlobalMouseState = extern(C) uint function(int* x, int* y);
	alias _pSDL_WarpMouseGlobal = extern(C) void function(int x, int y);
}
__gshared nothrow @nogc{
	package _pSDL_GetMouseFocus _SDL_GetMouseFocus;
	extern(C) SDL_Window* SDL_GetMouseFocus(){ return _SDL_GetMouseFocus(__traits(parameters)); }
	package _pSDL_GetMouseState _SDL_GetMouseState;
	extern(C) uint SDL_GetMouseState(int* x, int* y){ return _SDL_GetMouseState(__traits(parameters)); }
	package _pSDL_GetRelativeMouseState _SDL_GetRelativeMouseState;
	extern(C) uint SDL_GetRelativeMouseState(int* x, int* y){ return _SDL_GetRelativeMouseState(__traits(parameters)); }
	package _pSDL_WarpMouseInWindow _SDL_WarpMouseInWindow;
	extern(C) void SDL_WarpMouseInWindow(SDL_Window* window, int x, int y){ _SDL_WarpMouseInWindow(__traits(parameters)); }
	package _pSDL_SetRelativeMouseMode _SDL_SetRelativeMouseMode;
	extern(C) int SDL_SetRelativeMouseMode(SDL_bool enabled){ return _SDL_SetRelativeMouseMode(__traits(parameters)); }
	package _pSDL_GetRelativeMouseMode _SDL_GetRelativeMouseMode;
	extern(C) SDL_bool SDL_GetRelativeMouseMode(){ return _SDL_GetRelativeMouseMode(__traits(parameters)); }
	package _pSDL_CreateCursor _SDL_CreateCursor;
	extern(C) SDL_Cursor* SDL_CreateCursor(const(ubyte)* data, const(ubyte)* mask, int w, int h, int hotX, int hotY){ return _SDL_CreateCursor(__traits(parameters)); }
	package _pSDL_CreateColorCursor _SDL_CreateColorCursor;
	extern(C) SDL_Cursor* SDL_CreateColorCursor(SDL_Surface* surface, int hotX, int hotY){ return _SDL_CreateColorCursor(__traits(parameters)); }
	package _pSDL_CreateSystemCursor _SDL_CreateSystemCursor;
	extern(C) SDL_Cursor* SDL_CreateSystemCursor(SDL_SystemCursor id){ return _SDL_CreateSystemCursor(__traits(parameters)); }
	package _pSDL_SetCursor _SDL_SetCursor;
	extern(C) void SDL_SetCursor(SDL_Cursor* cursor){ _SDL_SetCursor(__traits(parameters)); }
	package _pSDL_GetCursor _SDL_GetCursor;
	extern(C) SDL_Cursor* SDL_GetCursor(){ return _SDL_GetCursor(__traits(parameters)); }
	package _pSDL_GetDefaultCursor _SDL_GetDefaultCursor;
	extern(C) SDL_Cursor* SDL_GetDefaultCursor(){ return _SDL_GetDefaultCursor(__traits(parameters)); }
	package _pSDL_FreeCursor _SDL_FreeCursor;
	extern(C) void SDL_FreeCursor(SDL_Cursor* cursor){ _SDL_FreeCursor(__traits(parameters)); }
	package _pSDL_ShowCursor _SDL_ShowCursor;
	extern(C) int SDL_ShowCursor(int toggle){ return _SDL_ShowCursor(__traits(parameters)); }
	package _pSDL_CaptureMouse _SDL_CaptureMouse;
	extern(C) int SDL_CaptureMouse(SDL_bool enabled){ return _SDL_CaptureMouse(__traits(parameters)); }
	package _pSDL_GetGlobalMouseState _SDL_GetGlobalMouseState;
	extern(C) uint SDL_GetGlobalMouseState(int* x, int* y){ return _SDL_GetGlobalMouseState(__traits(parameters)); }
	package _pSDL_WarpMouseGlobal _SDL_WarpMouseGlobal;
	extern(C) void SDL_WarpMouseGlobal(int x, int y){ _SDL_WarpMouseGlobal(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetMouseFocus, here.SDL_GetMouseFocus.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetMouseState, here.SDL_GetMouseState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRelativeMouseState, here.SDL_GetRelativeMouseState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WarpMouseInWindow, here.SDL_WarpMouseInWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetRelativeMouseMode, here.SDL_SetRelativeMouseMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRelativeMouseMode, here.SDL_GetRelativeMouseMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateCursor, here.SDL_CreateCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateColorCursor, here.SDL_CreateColorCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateSystemCursor, here.SDL_CreateSystemCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetCursor, here.SDL_SetCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetCursor, here.SDL_GetCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetDefaultCursor, here.SDL_GetDefaultCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_FreeCursor, here.SDL_FreeCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ShowCursor, here.SDL_ShowCursor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CaptureMouse, here.SDL_CaptureMouse.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetGlobalMouseState, here.SDL_GetGlobalMouseState.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WarpMouseGlobal, here.SDL_WarpMouseGlobal.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/mutex.d(24,1)
private nothrow @nogc{
	alias _pSDL_CreateMutex = extern(C) SDL_mutex* function();
	alias _pSDL_LockMutex = extern(C) int function(SDL_mutex* mutex);
	alias _pSDL_TryLockMutex = extern(C) int function(SDL_mutex* mutex);
	alias _pSDL_UnlockMutex = extern(C) int function(SDL_mutex* mutex);
	alias _pSDL_DestroyMutex = extern(C) void function(SDL_mutex* mutex);
	alias _pSDL_CreateSemaphore = extern(C) SDL_semaphore* function(uint initialValue);
	alias _pSDL_DestroySemaphore = extern(C) void function(SDL_semaphore* sem);
	alias _pSDL_SemWait = extern(C) int function(SDL_semaphore* sem);
	alias _pSDL_SemTryWait = extern(C) int function(SDL_semaphore* sem);
	alias _pSDL_SemWaitTimeout = extern(C) int function(SDL_semaphore* sem, uint timeout);
	alias _pSDL_SemPost = extern(C) int function(SDL_semaphore* sem);
	alias _pSDL_SemValue = extern(C) uint function(SDL_semaphore* sem);
	alias _pSDL_CreateCond = extern(C) SDL_cond* function();
	alias _pSDL_DestroyCond = extern(C) void function(SDL_cond* cond);
	alias _pSDL_CondSignal = extern(C) int function(SDL_cond* cond);
	alias _pSDL_CondBroadcast = extern(C) int function(SDL_cond* cond);
	alias _pSDL_CondWait = extern(C) int function(SDL_cond* cond, SDL_mutex*);
	alias _pSDL_CondWaitTimeout = extern(C) int function(SDL_cond* cond, SDL_mutex* mutex, uint ms);
}
__gshared nothrow @nogc{
	package _pSDL_CreateMutex _SDL_CreateMutex;
	extern(C) SDL_mutex* SDL_CreateMutex(){ return _SDL_CreateMutex(__traits(parameters)); }
	package _pSDL_LockMutex _SDL_LockMutex;
	extern(C) int SDL_LockMutex(SDL_mutex* mutex){ return _SDL_LockMutex(__traits(parameters)); }
	package _pSDL_TryLockMutex _SDL_TryLockMutex;
	extern(C) int SDL_TryLockMutex(SDL_mutex* mutex){ return _SDL_TryLockMutex(__traits(parameters)); }
	package _pSDL_UnlockMutex _SDL_UnlockMutex;
	extern(C) int SDL_UnlockMutex(SDL_mutex* mutex){ return _SDL_UnlockMutex(__traits(parameters)); }
	package _pSDL_DestroyMutex _SDL_DestroyMutex;
	extern(C) void SDL_DestroyMutex(SDL_mutex* mutex){ _SDL_DestroyMutex(__traits(parameters)); }
	package _pSDL_CreateSemaphore _SDL_CreateSemaphore;
	extern(C) SDL_semaphore* SDL_CreateSemaphore(uint initialValue){ return _SDL_CreateSemaphore(__traits(parameters)); }
	package _pSDL_DestroySemaphore _SDL_DestroySemaphore;
	extern(C) void SDL_DestroySemaphore(SDL_semaphore* sem){ _SDL_DestroySemaphore(__traits(parameters)); }
	package _pSDL_SemWait _SDL_SemWait;
	extern(C) int SDL_SemWait(SDL_semaphore* sem){ return _SDL_SemWait(__traits(parameters)); }
	package _pSDL_SemTryWait _SDL_SemTryWait;
	extern(C) int SDL_SemTryWait(SDL_semaphore* sem){ return _SDL_SemTryWait(__traits(parameters)); }
	package _pSDL_SemWaitTimeout _SDL_SemWaitTimeout;
	extern(C) int SDL_SemWaitTimeout(SDL_semaphore* sem, uint timeout){ return _SDL_SemWaitTimeout(__traits(parameters)); }
	package _pSDL_SemPost _SDL_SemPost;
	extern(C) int SDL_SemPost(SDL_semaphore* sem){ return _SDL_SemPost(__traits(parameters)); }
	package _pSDL_SemValue _SDL_SemValue;
	extern(C) uint SDL_SemValue(SDL_semaphore* sem){ return _SDL_SemValue(__traits(parameters)); }
	package _pSDL_CreateCond _SDL_CreateCond;
	extern(C) SDL_cond* SDL_CreateCond(){ return _SDL_CreateCond(__traits(parameters)); }
	package _pSDL_DestroyCond _SDL_DestroyCond;
	extern(C) void SDL_DestroyCond(SDL_cond* cond){ _SDL_DestroyCond(__traits(parameters)); }
	package _pSDL_CondSignal _SDL_CondSignal;
	extern(C) int SDL_CondSignal(SDL_cond* cond){ return _SDL_CondSignal(__traits(parameters)); }
	package _pSDL_CondBroadcast _SDL_CondBroadcast;
	extern(C) int SDL_CondBroadcast(SDL_cond* cond){ return _SDL_CondBroadcast(__traits(parameters)); }
	package _pSDL_CondWait _SDL_CondWait;
	extern(C) int SDL_CondWait(SDL_cond* cond, SDL_mutex*){ return _SDL_CondWait(__traits(parameters)); }
	package _pSDL_CondWaitTimeout _SDL_CondWaitTimeout;
	extern(C) int SDL_CondWaitTimeout(SDL_cond* cond, SDL_mutex* mutex, uint ms){ return _SDL_CondWaitTimeout(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_CreateMutex, here.SDL_CreateMutex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockMutex, here.SDL_LockMutex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_TryLockMutex, here.SDL_TryLockMutex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnlockMutex, here.SDL_UnlockMutex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DestroyMutex, here.SDL_DestroyMutex.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateSemaphore, here.SDL_CreateSemaphore.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DestroySemaphore, here.SDL_DestroySemaphore.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SemWait, here.SDL_SemWait.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SemTryWait, here.SDL_SemTryWait.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SemWaitTimeout, here.SDL_SemWaitTimeout.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SemPost, here.SDL_SemPost.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SemValue, here.SDL_SemValue.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateCond, here.SDL_CreateCond.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DestroyCond, here.SDL_DestroyCond.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CondSignal, here.SDL_CondSignal.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CondBroadcast, here.SDL_CondBroadcast.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CondWait, here.SDL_CondWait.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CondWaitTimeout, here.SDL_CondWaitTimeout.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/platform.d(13,1)
private nothrow @nogc{
	alias _pSDL_GetPlatform = extern(C) const(char)* function();
}
__gshared nothrow @nogc{
	package _pSDL_GetPlatform _SDL_GetPlatform;
	extern(C) const(char)* SDL_GetPlatform(){ return _SDL_GetPlatform(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetPlatform, here.SDL_GetPlatform.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/power.d(22,1)
private nothrow @nogc{
	alias _pSDL_GetPowerInfo = extern(C) SDL_PowerState function(int* seconds, int* percent);
}
__gshared nothrow @nogc{
	package _pSDL_GetPowerInfo _SDL_GetPowerInfo;
	extern(C) SDL_PowerState SDL_GetPowerInfo(int* seconds, int* percent){ return _SDL_GetPowerInfo(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetPowerInfo, here.SDL_GetPowerInfo.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/render.d(82,1)
private nothrow @nogc{
	alias _pSDL_GetNumRenderDrivers = extern(C) int function();
	alias _pSDL_GetRenderDriverInfo = extern(C) int function(int index, SDL_RendererInfo* info);
	alias _pSDL_CreateWindowAndRenderer = extern(C) int function(int width, int height, uint windowFlags, SDL_Window** window, SDL_Renderer** renderer);
	alias _pSDL_CreateRenderer = extern(C) SDL_Renderer* function(SDL_Window* window, int index, SDL_RendererFlags flags);
	alias _pSDL_CreateSoftwareRenderer = extern(C) SDL_Renderer* function(SDL_Surface* surface);
	alias _pSDL_GetRenderer = extern(C) SDL_Renderer* function(SDL_Window* window);
	alias _pSDL_GetRendererInfo = extern(C) int function(SDL_Renderer* renderer, SDL_RendererInfo* info);
	alias _pSDL_GetRendererOutputSize = extern(C) int function(SDL_Renderer* renderer, int* w, int* h);
	alias _pSDL_CreateTexture = extern(C) SDL_Texture* function(SDL_Renderer* renderer, uint format, SDL_TextureAccess access, int w, int h);
	alias _pSDL_CreateTextureFromSurface = extern(C) SDL_Texture* function(SDL_Renderer* renderer, SDL_Surface* surface);
	alias _pSDL_QueryTexture = extern(C) int function(SDL_Texture* texture, uint* format, SDL_TextureAccess* access, int* w, int* h);
	alias _pSDL_SetTextureColorMod = extern(C) int function(SDL_Texture* texture, ubyte r, ubyte g, ubyte b);
	alias _pSDL_GetTextureColorMod = extern(C) int function(SDL_Texture* texture, ubyte* r, ubyte* g, ubyte* b);
	alias _pSDL_SetTextureAlphaMod = extern(C) int function(SDL_Texture* texture, ubyte alpha);
	alias _pSDL_GetTextureAlphaMod = extern(C) int function(SDL_Texture* texture, ubyte* alpha);
	alias _pSDL_SetTextureBlendMode = extern(C) int function(SDL_Texture* texture, SDL_BlendMode blendMode);
	alias _pSDL_GetTextureBlendMode = extern(C) int function(SDL_Texture* texture, SDL_BlendMode* blendMode);
	alias _pSDL_UpdateTexture = extern(C) int function(SDL_Texture* texture, const(SDL_Rect)* rect, const(void)* pixels, int pitch);
	alias _pSDL_LockTexture = extern(C) int function(SDL_Texture* texture, const(SDL_Rect)* rect, void** pixels, int* pitch);
	alias _pSDL_UnlockTexture = extern(C) void function(SDL_Texture* texture);
	alias _pSDL_RenderTargetSupported = extern(C) SDL_bool function(SDL_Renderer* renderer);
	alias _pSDL_SetRenderTarget = extern(C) int function(SDL_Renderer* renderer, SDL_Texture* texture);
	alias _pSDL_GetRenderTarget = extern(C) SDL_Texture* function(SDL_Renderer* renderer);
	alias _pSDL_RenderSetClipRect = extern(C) int function(SDL_Renderer* renderer, const(SDL_Rect)* rect);
	alias _pSDL_RenderGetClipRect = extern(C) void function(SDL_Renderer* renderer, SDL_Rect* rect);
	alias _pSDL_RenderSetLogicalSize = extern(C) int function(SDL_Renderer* renderer, int w, int h);
	alias _pSDL_RenderGetLogicalSize = extern(C) void function(SDL_Renderer* renderer, int* w, int* h);
	alias _pSDL_RenderSetViewport = extern(C) int function(SDL_Renderer* renderer, const(SDL_Rect)* rect);
	alias _pSDL_RenderGetViewport = extern(C) void function(SDL_Renderer* renderer, SDL_Rect* rect);
	alias _pSDL_RenderSetScale = extern(C) int function(SDL_Renderer* renderer, float scaleX, float scaleY);
	alias _pSDL_RenderGetScale = extern(C) int function(SDL_Renderer* renderer, float* scaleX, float* scaleY);
	alias _pSDL_SetRenderDrawColor = extern(C) int function(SDL_Renderer* renderer, ubyte r, ubyte g, ubyte b, ubyte a);
	alias _pSDL_GetRenderDrawColor = extern(C) int function(SDL_Renderer* renderer, ubyte* r, ubyte* g, ubyte* b, ubyte* a);
	alias _pSDL_SetRenderDrawBlendMode = extern(C) int function(SDL_Renderer* renderer, SDL_BlendMode blendMode);
	alias _pSDL_GetRenderDrawBlendMode = extern(C) int function(SDL_Renderer* renderer, SDL_BlendMode* blendMode);
	alias _pSDL_RenderClear = extern(C) int function(SDL_Renderer* renderer);
	alias _pSDL_RenderDrawPoint = extern(C) int function(SDL_Renderer* renderer, int x, int y);
	alias _pSDL_RenderDrawPoints = extern(C) int function(SDL_Renderer* renderer, const(SDL_Point)* points, int count);
	alias _pSDL_RenderDrawLine = extern(C) int function(SDL_Renderer* renderer, int x1, int y1, int x2, int y2);
	alias _pSDL_RenderDrawLines = extern(C) int function(SDL_Renderer* renderer, const(SDL_Point)* points, int count);
	alias _pSDL_RenderDrawRect = extern(C) int function(SDL_Renderer* renderer, const(SDL_Rect)* rect);
	alias _pSDL_RenderDrawRects = extern(C) int function(SDL_Renderer* renderer, const(SDL_Rect)* rects, int count);
	alias _pSDL_RenderFillRect = extern(C) int function(SDL_Renderer* renderer, const(SDL_Rect)* rect);
	alias _pSDL_RenderFillRects = extern(C) int function(SDL_Renderer* renderer, const(SDL_Rect)* rects, int count);
	alias _pSDL_RenderCopy = extern(C) int function(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_Rect)* dstRect);
	alias _pSDL_RenderCopyEx = extern(C) int function(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_Rect)* dstRect, const(double) angle, const(SDL_Point)* centre, const(SDL_RendererFlip) flip);
	alias _pSDL_RenderReadPixels = extern(C) int function(SDL_Renderer* renderer, const(SDL_Rect)* rect, uint, void*, int);
	alias _pSDL_RenderPresent = extern(C) void function(SDL_Renderer* renderer);
	alias _pSDL_DestroyTexture = extern(C) void function(SDL_Texture* texture);
	alias _pSDL_DestroyRenderer = extern(C) void function(SDL_Renderer* renderer);
	alias _pSDL_GL_BindTexture = extern(C) int function(SDL_Texture* texture, float* texw, float* texh);
	alias _pSDL_GL_UnbindTexture = extern(C) int function(SDL_Texture* texture);
	alias _pSDL_UpdateYUVTexture = extern(C) int function(SDL_Texture* texture ,const(SDL_Rect)* rect, const(ubyte)* yPlane, int yPitch, const(ubyte)* uPlane, int uPitch, const(ubyte)* vPlane, int vPitch);
	alias _pSDL_RenderIsClipEnabled = extern(C) SDL_bool function(SDL_Renderer* renderer);
	alias _pSDL_RenderGetIntegerScale = extern(C) SDL_bool function(SDL_Renderer* renderer);
	alias _pSDL_RenderSetIntegerScale = extern(C) int function(SDL_Renderer* renderer, SDL_bool);
	alias _pSDL_RenderGetMetalLayer = extern(C) void* function(SDL_Renderer* renderer);
	alias _pSDL_RenderGetMetalCommandEncoder = extern(C) void* function(SDL_Renderer* renderer);
	alias _pSDL_RenderDrawPointF = extern(C) int function(SDL_Renderer* renderer, float x, float y);
	alias _pSDL_RenderDrawPointsF = extern(C) int function(SDL_Renderer* renderer, const(SDL_FPoint)* points, int count);
	alias _pSDL_RenderDrawLineF = extern(C) int function(SDL_Renderer* renderer, float x1, float y1, float x2, float y2);
	alias _pSDL_RenderDrawLinesF = extern(C) int function(SDL_Renderer* renderer, const(SDL_FPoint)* points, int count);
	alias _pSDL_RenderDrawRectF = extern(C) int function(SDL_Renderer* renderer, const(SDL_FRect)* rect);
	alias _pSDL_RenderDrawRectsF = extern(C) int function(SDL_Renderer* renderer, const(SDL_FRect)* rects, int count);
	alias _pSDL_RenderFillRectF = extern(C) int function(SDL_Renderer* renderer, const(SDL_FRect)* rect);
	alias _pSDL_RenderFillRectsF = extern(C) int function(SDL_Renderer* renderer, const(SDL_FRect)* rects, int count);
	alias _pSDL_RenderCopyF = extern(C) int function(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_FRect)* dstRect);
	alias _pSDL_RenderCopyExF = extern(C) int function(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_FRect)* dstRect, const(double) angle, const(SDL_FPoint)* centre, const(SDL_RendererFlip) flip);
	alias _pSDL_RenderFlush = extern(C) int function(SDL_Renderer* renderer);
	alias _pSDL_SetTextureScaleMode = extern(C) int function(SDL_Texture* texture, SDL_ScaleMode scaleMode);
	alias _pSDL_GetTextureScaleMode = extern(C) int function(SDL_Texture* texture, SDL_ScaleMode* scaleMode);
	alias _pSDL_LockTextureToSurface = extern(C) int function(SDL_Texture* texture, const(SDL_Rect)* rect, SDL_Surface** surface);
	alias _pSDL_UpdateNVTexture = extern(C) int function(SDL_Texture* texture, const(SDL_Rect)* rect, const(ubyte)* yPlane, int yPitch, const(ubyte)* uvPlane, int uvPitch);
	alias _pSDL_SetTextureUserData = extern(C) int function(SDL_Texture* texture, void* userdata);
	alias _pSDL_GetTextureUserData = extern(C) void* function(SDL_Texture* texture);
	alias _pSDL_RenderWindowToLogical = extern(C) void function(SDL_Renderer* renderer, int windowX, int windowY, float* logicalX, float* logicalY);
	alias _pSDL_RenderLogicalToWindow = extern(C) void function(SDL_Renderer* renderer, float logicalX, float logicalY, int* windowX, int* windowY);
	alias _pSDL_RenderGeometry = extern(C) int function(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Vertex)* vertices, int numVertices, const(int)* indices, int numIndices);
	alias _pSDL_RenderSetVSync = extern(C) int function(SDL_Renderer* renderer, int vsync);
	alias _pSDL_RenderGeometryRaw = extern(C) int function(SDL_Renderer* renderer, SDL_Texture* texture, const(float)* xy, int xyStride, const(SDL_Color)* colour, int colourStride, const(float)* uv, int uvStride, int numVertices, const(void)* indices, int numIndices, int sizeIndices);
	alias _pSDL_RenderGetWindow = extern(C) SDL_Window* function(SDL_Renderer* renderer);
}
__gshared nothrow @nogc{
	package _pSDL_GetNumRenderDrivers _SDL_GetNumRenderDrivers;
	extern(C) int SDL_GetNumRenderDrivers(){ return _SDL_GetNumRenderDrivers(__traits(parameters)); }
	package _pSDL_GetRenderDriverInfo _SDL_GetRenderDriverInfo;
	extern(C) int SDL_GetRenderDriverInfo(int index, SDL_RendererInfo* info){ return _SDL_GetRenderDriverInfo(__traits(parameters)); }
	package _pSDL_CreateWindowAndRenderer _SDL_CreateWindowAndRenderer;
	extern(C) int SDL_CreateWindowAndRenderer(int width, int height, uint windowFlags, SDL_Window** window, SDL_Renderer** renderer){ return _SDL_CreateWindowAndRenderer(__traits(parameters)); }
	package _pSDL_CreateRenderer _SDL_CreateRenderer;
	extern(C) SDL_Renderer* SDL_CreateRenderer(SDL_Window* window, int index, SDL_RendererFlags flags){ return _SDL_CreateRenderer(__traits(parameters)); }
	package _pSDL_CreateSoftwareRenderer _SDL_CreateSoftwareRenderer;
	extern(C) SDL_Renderer* SDL_CreateSoftwareRenderer(SDL_Surface* surface){ return _SDL_CreateSoftwareRenderer(__traits(parameters)); }
	package _pSDL_GetRenderer _SDL_GetRenderer;
	extern(C) SDL_Renderer* SDL_GetRenderer(SDL_Window* window){ return _SDL_GetRenderer(__traits(parameters)); }
	package _pSDL_GetRendererInfo _SDL_GetRendererInfo;
	extern(C) int SDL_GetRendererInfo(SDL_Renderer* renderer, SDL_RendererInfo* info){ return _SDL_GetRendererInfo(__traits(parameters)); }
	package _pSDL_GetRendererOutputSize _SDL_GetRendererOutputSize;
	extern(C) int SDL_GetRendererOutputSize(SDL_Renderer* renderer, int* w, int* h){ return _SDL_GetRendererOutputSize(__traits(parameters)); }
	package _pSDL_CreateTexture _SDL_CreateTexture;
	extern(C) SDL_Texture* SDL_CreateTexture(SDL_Renderer* renderer, uint format, SDL_TextureAccess access, int w, int h){ return _SDL_CreateTexture(__traits(parameters)); }
	package _pSDL_CreateTextureFromSurface _SDL_CreateTextureFromSurface;
	extern(C) SDL_Texture* SDL_CreateTextureFromSurface(SDL_Renderer* renderer, SDL_Surface* surface){ return _SDL_CreateTextureFromSurface(__traits(parameters)); }
	package _pSDL_QueryTexture _SDL_QueryTexture;
	extern(C) int SDL_QueryTexture(SDL_Texture* texture, uint* format, SDL_TextureAccess* access, int* w, int* h){ return _SDL_QueryTexture(__traits(parameters)); }
	package _pSDL_SetTextureColorMod _SDL_SetTextureColorMod;
	extern(C) int SDL_SetTextureColorMod(SDL_Texture* texture, ubyte r, ubyte g, ubyte b){ return _SDL_SetTextureColorMod(__traits(parameters)); }
	package _pSDL_GetTextureColorMod _SDL_GetTextureColorMod;
	extern(C) int SDL_GetTextureColorMod(SDL_Texture* texture, ubyte* r, ubyte* g, ubyte* b){ return _SDL_GetTextureColorMod(__traits(parameters)); }
	package _pSDL_SetTextureAlphaMod _SDL_SetTextureAlphaMod;
	extern(C) int SDL_SetTextureAlphaMod(SDL_Texture* texture, ubyte alpha){ return _SDL_SetTextureAlphaMod(__traits(parameters)); }
	package _pSDL_GetTextureAlphaMod _SDL_GetTextureAlphaMod;
	extern(C) int SDL_GetTextureAlphaMod(SDL_Texture* texture, ubyte* alpha){ return _SDL_GetTextureAlphaMod(__traits(parameters)); }
	package _pSDL_SetTextureBlendMode _SDL_SetTextureBlendMode;
	extern(C) int SDL_SetTextureBlendMode(SDL_Texture* texture, SDL_BlendMode blendMode){ return _SDL_SetTextureBlendMode(__traits(parameters)); }
	package _pSDL_GetTextureBlendMode _SDL_GetTextureBlendMode;
	extern(C) int SDL_GetTextureBlendMode(SDL_Texture* texture, SDL_BlendMode* blendMode){ return _SDL_GetTextureBlendMode(__traits(parameters)); }
	package _pSDL_UpdateTexture _SDL_UpdateTexture;
	extern(C) int SDL_UpdateTexture(SDL_Texture* texture, const(SDL_Rect)* rect, const(void)* pixels, int pitch){ return _SDL_UpdateTexture(__traits(parameters)); }
	package _pSDL_LockTexture _SDL_LockTexture;
	extern(C) int SDL_LockTexture(SDL_Texture* texture, const(SDL_Rect)* rect, void** pixels, int* pitch){ return _SDL_LockTexture(__traits(parameters)); }
	package _pSDL_UnlockTexture _SDL_UnlockTexture;
	extern(C) void SDL_UnlockTexture(SDL_Texture* texture){ _SDL_UnlockTexture(__traits(parameters)); }
	package _pSDL_RenderTargetSupported _SDL_RenderTargetSupported;
	extern(C) SDL_bool SDL_RenderTargetSupported(SDL_Renderer* renderer){ return _SDL_RenderTargetSupported(__traits(parameters)); }
	package _pSDL_SetRenderTarget _SDL_SetRenderTarget;
	extern(C) int SDL_SetRenderTarget(SDL_Renderer* renderer, SDL_Texture* texture){ return _SDL_SetRenderTarget(__traits(parameters)); }
	package _pSDL_GetRenderTarget _SDL_GetRenderTarget;
	extern(C) SDL_Texture* SDL_GetRenderTarget(SDL_Renderer* renderer){ return _SDL_GetRenderTarget(__traits(parameters)); }
	package _pSDL_RenderSetClipRect _SDL_RenderSetClipRect;
	extern(C) int SDL_RenderSetClipRect(SDL_Renderer* renderer, const(SDL_Rect)* rect){ return _SDL_RenderSetClipRect(__traits(parameters)); }
	package _pSDL_RenderGetClipRect _SDL_RenderGetClipRect;
	extern(C) void SDL_RenderGetClipRect(SDL_Renderer* renderer, SDL_Rect* rect){ _SDL_RenderGetClipRect(__traits(parameters)); }
	package _pSDL_RenderSetLogicalSize _SDL_RenderSetLogicalSize;
	extern(C) int SDL_RenderSetLogicalSize(SDL_Renderer* renderer, int w, int h){ return _SDL_RenderSetLogicalSize(__traits(parameters)); }
	package _pSDL_RenderGetLogicalSize _SDL_RenderGetLogicalSize;
	extern(C) void SDL_RenderGetLogicalSize(SDL_Renderer* renderer, int* w, int* h){ _SDL_RenderGetLogicalSize(__traits(parameters)); }
	package _pSDL_RenderSetViewport _SDL_RenderSetViewport;
	extern(C) int SDL_RenderSetViewport(SDL_Renderer* renderer, const(SDL_Rect)* rect){ return _SDL_RenderSetViewport(__traits(parameters)); }
	package _pSDL_RenderGetViewport _SDL_RenderGetViewport;
	extern(C) void SDL_RenderGetViewport(SDL_Renderer* renderer, SDL_Rect* rect){ _SDL_RenderGetViewport(__traits(parameters)); }
	package _pSDL_RenderSetScale _SDL_RenderSetScale;
	extern(C) int SDL_RenderSetScale(SDL_Renderer* renderer, float scaleX, float scaleY){ return _SDL_RenderSetScale(__traits(parameters)); }
	package _pSDL_RenderGetScale _SDL_RenderGetScale;
	extern(C) int SDL_RenderGetScale(SDL_Renderer* renderer, float* scaleX, float* scaleY){ return _SDL_RenderGetScale(__traits(parameters)); }
	package _pSDL_SetRenderDrawColor _SDL_SetRenderDrawColor;
	extern(C) int SDL_SetRenderDrawColor(SDL_Renderer* renderer, ubyte r, ubyte g, ubyte b, ubyte a){ return _SDL_SetRenderDrawColor(__traits(parameters)); }
	package _pSDL_GetRenderDrawColor _SDL_GetRenderDrawColor;
	extern(C) int SDL_GetRenderDrawColor(SDL_Renderer* renderer, ubyte* r, ubyte* g, ubyte* b, ubyte* a){ return _SDL_GetRenderDrawColor(__traits(parameters)); }
	package _pSDL_SetRenderDrawBlendMode _SDL_SetRenderDrawBlendMode;
	extern(C) int SDL_SetRenderDrawBlendMode(SDL_Renderer* renderer, SDL_BlendMode blendMode){ return _SDL_SetRenderDrawBlendMode(__traits(parameters)); }
	package _pSDL_GetRenderDrawBlendMode _SDL_GetRenderDrawBlendMode;
	extern(C) int SDL_GetRenderDrawBlendMode(SDL_Renderer* renderer, SDL_BlendMode* blendMode){ return _SDL_GetRenderDrawBlendMode(__traits(parameters)); }
	package _pSDL_RenderClear _SDL_RenderClear;
	extern(C) int SDL_RenderClear(SDL_Renderer* renderer){ return _SDL_RenderClear(__traits(parameters)); }
	package _pSDL_RenderDrawPoint _SDL_RenderDrawPoint;
	extern(C) int SDL_RenderDrawPoint(SDL_Renderer* renderer, int x, int y){ return _SDL_RenderDrawPoint(__traits(parameters)); }
	package _pSDL_RenderDrawPoints _SDL_RenderDrawPoints;
	extern(C) int SDL_RenderDrawPoints(SDL_Renderer* renderer, const(SDL_Point)* points, int count){ return _SDL_RenderDrawPoints(__traits(parameters)); }
	package _pSDL_RenderDrawLine _SDL_RenderDrawLine;
	extern(C) int SDL_RenderDrawLine(SDL_Renderer* renderer, int x1, int y1, int x2, int y2){ return _SDL_RenderDrawLine(__traits(parameters)); }
	package _pSDL_RenderDrawLines _SDL_RenderDrawLines;
	extern(C) int SDL_RenderDrawLines(SDL_Renderer* renderer, const(SDL_Point)* points, int count){ return _SDL_RenderDrawLines(__traits(parameters)); }
	package _pSDL_RenderDrawRect _SDL_RenderDrawRect;
	extern(C) int SDL_RenderDrawRect(SDL_Renderer* renderer, const(SDL_Rect)* rect){ return _SDL_RenderDrawRect(__traits(parameters)); }
	package _pSDL_RenderDrawRects _SDL_RenderDrawRects;
	extern(C) int SDL_RenderDrawRects(SDL_Renderer* renderer, const(SDL_Rect)* rects, int count){ return _SDL_RenderDrawRects(__traits(parameters)); }
	package _pSDL_RenderFillRect _SDL_RenderFillRect;
	extern(C) int SDL_RenderFillRect(SDL_Renderer* renderer, const(SDL_Rect)* rect){ return _SDL_RenderFillRect(__traits(parameters)); }
	package _pSDL_RenderFillRects _SDL_RenderFillRects;
	extern(C) int SDL_RenderFillRects(SDL_Renderer* renderer, const(SDL_Rect)* rects, int count){ return _SDL_RenderFillRects(__traits(parameters)); }
	package _pSDL_RenderCopy _SDL_RenderCopy;
	extern(C) int SDL_RenderCopy(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_Rect)* dstRect){ return _SDL_RenderCopy(__traits(parameters)); }
	package _pSDL_RenderCopyEx _SDL_RenderCopyEx;
	extern(C) int SDL_RenderCopyEx(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_Rect)* dstRect, const(double) angle, const(SDL_Point)* centre, const(SDL_RendererFlip) flip){ return _SDL_RenderCopyEx(__traits(parameters)); }
	package _pSDL_RenderReadPixels _SDL_RenderReadPixels;
	extern(C) int SDL_RenderReadPixels(SDL_Renderer* renderer, const(SDL_Rect)* rect, uint, void*, int){ return _SDL_RenderReadPixels(__traits(parameters)); }
	package _pSDL_RenderPresent _SDL_RenderPresent;
	extern(C) void SDL_RenderPresent(SDL_Renderer* renderer){ _SDL_RenderPresent(__traits(parameters)); }
	package _pSDL_DestroyTexture _SDL_DestroyTexture;
	extern(C) void SDL_DestroyTexture(SDL_Texture* texture){ _SDL_DestroyTexture(__traits(parameters)); }
	package _pSDL_DestroyRenderer _SDL_DestroyRenderer;
	extern(C) void SDL_DestroyRenderer(SDL_Renderer* renderer){ _SDL_DestroyRenderer(__traits(parameters)); }
	package _pSDL_GL_BindTexture _SDL_GL_BindTexture;
	extern(C) int SDL_GL_BindTexture(SDL_Texture* texture, float* texw, float* texh){ return _SDL_GL_BindTexture(__traits(parameters)); }
	package _pSDL_GL_UnbindTexture _SDL_GL_UnbindTexture;
	extern(C) int SDL_GL_UnbindTexture(SDL_Texture* texture){ return _SDL_GL_UnbindTexture(__traits(parameters)); }
	package _pSDL_UpdateYUVTexture _SDL_UpdateYUVTexture;
	extern(C) int SDL_UpdateYUVTexture(SDL_Texture* texture ,const(SDL_Rect)* rect, const(ubyte)* yPlane, int yPitch, const(ubyte)* uPlane, int uPitch, const(ubyte)* vPlane, int vPitch){ return _SDL_UpdateYUVTexture(__traits(parameters)); }
	package _pSDL_RenderIsClipEnabled _SDL_RenderIsClipEnabled;
	extern(C) SDL_bool SDL_RenderIsClipEnabled(SDL_Renderer* renderer){ return _SDL_RenderIsClipEnabled(__traits(parameters)); }
	package _pSDL_RenderGetIntegerScale _SDL_RenderGetIntegerScale;
	extern(C) SDL_bool SDL_RenderGetIntegerScale(SDL_Renderer* renderer){ return _SDL_RenderGetIntegerScale(__traits(parameters)); }
	package _pSDL_RenderSetIntegerScale _SDL_RenderSetIntegerScale;
	extern(C) int SDL_RenderSetIntegerScale(SDL_Renderer* renderer, SDL_bool){ return _SDL_RenderSetIntegerScale(__traits(parameters)); }
	package _pSDL_RenderGetMetalLayer _SDL_RenderGetMetalLayer;
	extern(C) void* SDL_RenderGetMetalLayer(SDL_Renderer* renderer){ return _SDL_RenderGetMetalLayer(__traits(parameters)); }
	package _pSDL_RenderGetMetalCommandEncoder _SDL_RenderGetMetalCommandEncoder;
	extern(C) void* SDL_RenderGetMetalCommandEncoder(SDL_Renderer* renderer){ return _SDL_RenderGetMetalCommandEncoder(__traits(parameters)); }
	package _pSDL_RenderDrawPointF _SDL_RenderDrawPointF;
	extern(C) int SDL_RenderDrawPointF(SDL_Renderer* renderer, float x, float y){ return _SDL_RenderDrawPointF(__traits(parameters)); }
	package _pSDL_RenderDrawPointsF _SDL_RenderDrawPointsF;
	extern(C) int SDL_RenderDrawPointsF(SDL_Renderer* renderer, const(SDL_FPoint)* points, int count){ return _SDL_RenderDrawPointsF(__traits(parameters)); }
	package _pSDL_RenderDrawLineF _SDL_RenderDrawLineF;
	extern(C) int SDL_RenderDrawLineF(SDL_Renderer* renderer, float x1, float y1, float x2, float y2){ return _SDL_RenderDrawLineF(__traits(parameters)); }
	package _pSDL_RenderDrawLinesF _SDL_RenderDrawLinesF;
	extern(C) int SDL_RenderDrawLinesF(SDL_Renderer* renderer, const(SDL_FPoint)* points, int count){ return _SDL_RenderDrawLinesF(__traits(parameters)); }
	package _pSDL_RenderDrawRectF _SDL_RenderDrawRectF;
	extern(C) int SDL_RenderDrawRectF(SDL_Renderer* renderer, const(SDL_FRect)* rect){ return _SDL_RenderDrawRectF(__traits(parameters)); }
	package _pSDL_RenderDrawRectsF _SDL_RenderDrawRectsF;
	extern(C) int SDL_RenderDrawRectsF(SDL_Renderer* renderer, const(SDL_FRect)* rects, int count){ return _SDL_RenderDrawRectsF(__traits(parameters)); }
	package _pSDL_RenderFillRectF _SDL_RenderFillRectF;
	extern(C) int SDL_RenderFillRectF(SDL_Renderer* renderer, const(SDL_FRect)* rect){ return _SDL_RenderFillRectF(__traits(parameters)); }
	package _pSDL_RenderFillRectsF _SDL_RenderFillRectsF;
	extern(C) int SDL_RenderFillRectsF(SDL_Renderer* renderer, const(SDL_FRect)* rects, int count){ return _SDL_RenderFillRectsF(__traits(parameters)); }
	package _pSDL_RenderCopyF _SDL_RenderCopyF;
	extern(C) int SDL_RenderCopyF(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_FRect)* dstRect){ return _SDL_RenderCopyF(__traits(parameters)); }
	package _pSDL_RenderCopyExF _SDL_RenderCopyExF;
	extern(C) int SDL_RenderCopyExF(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Rect)* srcRect, const(SDL_FRect)* dstRect, const(double) angle, const(SDL_FPoint)* centre, const(SDL_RendererFlip) flip){ return _SDL_RenderCopyExF(__traits(parameters)); }
	package _pSDL_RenderFlush _SDL_RenderFlush;
	extern(C) int SDL_RenderFlush(SDL_Renderer* renderer){ return _SDL_RenderFlush(__traits(parameters)); }
	package _pSDL_SetTextureScaleMode _SDL_SetTextureScaleMode;
	extern(C) int SDL_SetTextureScaleMode(SDL_Texture* texture, SDL_ScaleMode scaleMode){ return _SDL_SetTextureScaleMode(__traits(parameters)); }
	package _pSDL_GetTextureScaleMode _SDL_GetTextureScaleMode;
	extern(C) int SDL_GetTextureScaleMode(SDL_Texture* texture, SDL_ScaleMode* scaleMode){ return _SDL_GetTextureScaleMode(__traits(parameters)); }
	package _pSDL_LockTextureToSurface _SDL_LockTextureToSurface;
	extern(C) int SDL_LockTextureToSurface(SDL_Texture* texture, const(SDL_Rect)* rect, SDL_Surface** surface){ return _SDL_LockTextureToSurface(__traits(parameters)); }
	package _pSDL_UpdateNVTexture _SDL_UpdateNVTexture;
	extern(C) int SDL_UpdateNVTexture(SDL_Texture* texture, const(SDL_Rect)* rect, const(ubyte)* yPlane, int yPitch, const(ubyte)* uvPlane, int uvPitch){ return _SDL_UpdateNVTexture(__traits(parameters)); }
	package _pSDL_SetTextureUserData _SDL_SetTextureUserData;
	extern(C) int SDL_SetTextureUserData(SDL_Texture* texture, void* userdata){ return _SDL_SetTextureUserData(__traits(parameters)); }
	package _pSDL_GetTextureUserData _SDL_GetTextureUserData;
	extern(C) void* SDL_GetTextureUserData(SDL_Texture* texture){ return _SDL_GetTextureUserData(__traits(parameters)); }
	package _pSDL_RenderWindowToLogical _SDL_RenderWindowToLogical;
	extern(C) void SDL_RenderWindowToLogical(SDL_Renderer* renderer, int windowX, int windowY, float* logicalX, float* logicalY){ _SDL_RenderWindowToLogical(__traits(parameters)); }
	package _pSDL_RenderLogicalToWindow _SDL_RenderLogicalToWindow;
	extern(C) void SDL_RenderLogicalToWindow(SDL_Renderer* renderer, float logicalX, float logicalY, int* windowX, int* windowY){ _SDL_RenderLogicalToWindow(__traits(parameters)); }
	package _pSDL_RenderGeometry _SDL_RenderGeometry;
	extern(C) int SDL_RenderGeometry(SDL_Renderer* renderer, SDL_Texture* texture, const(SDL_Vertex)* vertices, int numVertices, const(int)* indices, int numIndices){ return _SDL_RenderGeometry(__traits(parameters)); }
	package _pSDL_RenderSetVSync _SDL_RenderSetVSync;
	extern(C) int SDL_RenderSetVSync(SDL_Renderer* renderer, int vsync){ return _SDL_RenderSetVSync(__traits(parameters)); }
	package _pSDL_RenderGeometryRaw _SDL_RenderGeometryRaw;
	extern(C) int SDL_RenderGeometryRaw(SDL_Renderer* renderer, SDL_Texture* texture, const(float)* xy, int xyStride, const(SDL_Color)* colour, int colourStride, const(float)* uv, int uvStride, int numVertices, const(void)* indices, int numIndices, int sizeIndices){ return _SDL_RenderGeometryRaw(__traits(parameters)); }
	package _pSDL_RenderGetWindow _SDL_RenderGetWindow;
	extern(C) SDL_Window* SDL_RenderGetWindow(SDL_Renderer* renderer){ return _SDL_RenderGetWindow(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetNumRenderDrivers, here.SDL_GetNumRenderDrivers.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRenderDriverInfo, here.SDL_GetRenderDriverInfo.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateWindowAndRenderer, here.SDL_CreateWindowAndRenderer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateRenderer, here.SDL_CreateRenderer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateSoftwareRenderer, here.SDL_CreateSoftwareRenderer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRenderer, here.SDL_GetRenderer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRendererInfo, here.SDL_GetRendererInfo.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRendererOutputSize, here.SDL_GetRendererOutputSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateTexture, here.SDL_CreateTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateTextureFromSurface, here.SDL_CreateTextureFromSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_QueryTexture, here.SDL_QueryTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetTextureColorMod, here.SDL_SetTextureColorMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTextureColorMod, here.SDL_GetTextureColorMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetTextureAlphaMod, here.SDL_SetTextureAlphaMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTextureAlphaMod, here.SDL_GetTextureAlphaMod.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetTextureBlendMode, here.SDL_SetTextureBlendMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTextureBlendMode, here.SDL_GetTextureBlendMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UpdateTexture, here.SDL_UpdateTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockTexture, here.SDL_LockTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UnlockTexture, here.SDL_UnlockTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderTargetSupported, here.SDL_RenderTargetSupported.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetRenderTarget, here.SDL_SetRenderTarget.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRenderTarget, here.SDL_GetRenderTarget.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderSetClipRect, here.SDL_RenderSetClipRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetClipRect, here.SDL_RenderGetClipRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderSetLogicalSize, here.SDL_RenderSetLogicalSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetLogicalSize, here.SDL_RenderGetLogicalSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderSetViewport, here.SDL_RenderSetViewport.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetViewport, here.SDL_RenderGetViewport.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderSetScale, here.SDL_RenderSetScale.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetScale, here.SDL_RenderGetScale.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetRenderDrawColor, here.SDL_SetRenderDrawColor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRenderDrawColor, here.SDL_GetRenderDrawColor.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetRenderDrawBlendMode, here.SDL_SetRenderDrawBlendMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRenderDrawBlendMode, here.SDL_GetRenderDrawBlendMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderClear, here.SDL_RenderClear.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawPoint, here.SDL_RenderDrawPoint.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawPoints, here.SDL_RenderDrawPoints.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawLine, here.SDL_RenderDrawLine.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawLines, here.SDL_RenderDrawLines.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawRect, here.SDL_RenderDrawRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawRects, here.SDL_RenderDrawRects.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderFillRect, here.SDL_RenderFillRect.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderFillRects, here.SDL_RenderFillRects.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderCopy, here.SDL_RenderCopy.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderCopyEx, here.SDL_RenderCopyEx.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderReadPixels, here.SDL_RenderReadPixels.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderPresent, here.SDL_RenderPresent.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DestroyTexture, here.SDL_DestroyTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DestroyRenderer, here.SDL_DestroyRenderer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_BindTexture, here.SDL_GL_BindTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GL_UnbindTexture, here.SDL_GL_UnbindTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UpdateYUVTexture, here.SDL_UpdateYUVTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderIsClipEnabled, here.SDL_RenderIsClipEnabled.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetIntegerScale, here.SDL_RenderGetIntegerScale.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderSetIntegerScale, here.SDL_RenderSetIntegerScale.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetMetalLayer, here.SDL_RenderGetMetalLayer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetMetalCommandEncoder, here.SDL_RenderGetMetalCommandEncoder.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawPointF, here.SDL_RenderDrawPointF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawPointsF, here.SDL_RenderDrawPointsF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawLineF, here.SDL_RenderDrawLineF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawLinesF, here.SDL_RenderDrawLinesF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawRectF, here.SDL_RenderDrawRectF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderDrawRectsF, here.SDL_RenderDrawRectsF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderFillRectF, here.SDL_RenderFillRectF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderFillRectsF, here.SDL_RenderFillRectsF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderCopyF, here.SDL_RenderCopyF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderCopyExF, here.SDL_RenderCopyExF.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderFlush, here.SDL_RenderFlush.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetTextureScaleMode, here.SDL_SetTextureScaleMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTextureScaleMode, here.SDL_GetTextureScaleMode.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LockTextureToSurface, here.SDL_LockTextureToSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_UpdateNVTexture, here.SDL_UpdateNVTexture.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetTextureUserData, here.SDL_SetTextureUserData.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTextureUserData, here.SDL_GetTextureUserData.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderWindowToLogical, here.SDL_RenderWindowToLogical.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderLogicalToWindow, here.SDL_RenderLogicalToWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGeometry, here.SDL_RenderGeometry.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderSetVSync, here.SDL_RenderSetVSync.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGeometryRaw, here.SDL_RenderGeometryRaw.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RenderGetWindow, here.SDL_RenderGetWindow.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/shape.d(50,1)
private nothrow @nogc{
	alias _pSDL_CreateShapedWindow = extern(C) SDL_Window* function(const(char)* title, uint x, uint y, uint w, uint h, SDL_WindowFlags flags);
	alias _pSDL_IsShapedWindow = extern(C) SDL_bool function(const(SDL_Window)* window);
	alias _pSDL_SetWindowShape = extern(C) int function(SDL_Window* window, SDL_Surface* shape, SDL_WindowShapeMode* shapeMode);
	alias _pSDL_GetShapedWindowMode = extern(C) int function(SDL_Window* window, SDL_WindowShapeMode* shapeMode);
}
__gshared nothrow @nogc{
	package _pSDL_CreateShapedWindow _SDL_CreateShapedWindow;
	extern(C) SDL_Window* SDL_CreateShapedWindow(const(char)* title, uint x, uint y, uint w, uint h, SDL_WindowFlags flags){ return _SDL_CreateShapedWindow(__traits(parameters)); }
	package _pSDL_IsShapedWindow _SDL_IsShapedWindow;
	extern(C) SDL_bool SDL_IsShapedWindow(const(SDL_Window)* window){ return _SDL_IsShapedWindow(__traits(parameters)); }
	package _pSDL_SetWindowShape _SDL_SetWindowShape;
	extern(C) int SDL_SetWindowShape(SDL_Window* window, SDL_Surface* shape, SDL_WindowShapeMode* shapeMode){ return _SDL_SetWindowShape(__traits(parameters)); }
	package _pSDL_GetShapedWindowMode _SDL_GetShapedWindowMode;
	extern(C) int SDL_GetShapedWindowMode(SDL_Window* window, SDL_WindowShapeMode* shapeMode){ return _SDL_GetShapedWindowMode(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_CreateShapedWindow, here.SDL_CreateShapedWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_IsShapedWindow, here.SDL_IsShapedWindow.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetWindowShape, here.SDL_SetWindowShape.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetShapedWindowMode, here.SDL_GetShapedWindowMode.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/system.d(66,1)
private nothrow @nogc{
	alias _pSDL_IsTablet = extern(C) SDL_bool function();
	alias _pSDL_OnApplicationWillTerminate = extern(C) void function();
	alias _pSDL_OnApplicationDidReceiveMemoryWarning = extern(C) void function();
	alias _pSDL_OnApplicationWillResignActive = extern(C) void function();
	alias _pSDL_OnApplicationDidEnterBackground = extern(C) void function();
	alias _pSDL_OnApplicationWillEnterForeground = extern(C) void function();
	alias _pSDL_OnApplicationDidBecomeActive = extern(C) void function();
	alias _pSDL_LinuxSetThreadPriority = extern(C) int function(long threadID, int priority);
	alias _pSDL_LinuxSetThreadPriorityAndPolicy = extern(C) int function(long threadID, int sdlPriority, int schedPolicy);
}
__gshared nothrow @nogc{
	package _pSDL_IsTablet _SDL_IsTablet;
	extern(C) SDL_bool SDL_IsTablet(){ return _SDL_IsTablet(__traits(parameters)); }
	package _pSDL_OnApplicationWillTerminate _SDL_OnApplicationWillTerminate;
	extern(C) void SDL_OnApplicationWillTerminate(){ _SDL_OnApplicationWillTerminate(__traits(parameters)); }
	package _pSDL_OnApplicationDidReceiveMemoryWarning _SDL_OnApplicationDidReceiveMemoryWarning;
	extern(C) void SDL_OnApplicationDidReceiveMemoryWarning(){ _SDL_OnApplicationDidReceiveMemoryWarning(__traits(parameters)); }
	package _pSDL_OnApplicationWillResignActive _SDL_OnApplicationWillResignActive;
	extern(C) void SDL_OnApplicationWillResignActive(){ _SDL_OnApplicationWillResignActive(__traits(parameters)); }
	package _pSDL_OnApplicationDidEnterBackground _SDL_OnApplicationDidEnterBackground;
	extern(C) void SDL_OnApplicationDidEnterBackground(){ _SDL_OnApplicationDidEnterBackground(__traits(parameters)); }
	package _pSDL_OnApplicationWillEnterForeground _SDL_OnApplicationWillEnterForeground;
	extern(C) void SDL_OnApplicationWillEnterForeground(){ _SDL_OnApplicationWillEnterForeground(__traits(parameters)); }
	package _pSDL_OnApplicationDidBecomeActive _SDL_OnApplicationDidBecomeActive;
	extern(C) void SDL_OnApplicationDidBecomeActive(){ _SDL_OnApplicationDidBecomeActive(__traits(parameters)); }
	package _pSDL_LinuxSetThreadPriority _SDL_LinuxSetThreadPriority;
	extern(C) int SDL_LinuxSetThreadPriority(long threadID, int priority){ return _SDL_LinuxSetThreadPriority(__traits(parameters)); }
	package _pSDL_LinuxSetThreadPriorityAndPolicy _SDL_LinuxSetThreadPriorityAndPolicy;
	extern(C) int SDL_LinuxSetThreadPriorityAndPolicy(long threadID, int sdlPriority, int schedPolicy){ return _SDL_LinuxSetThreadPriorityAndPolicy(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_IsTablet, here.SDL_IsTablet.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OnApplicationWillTerminate, here.SDL_OnApplicationWillTerminate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OnApplicationDidReceiveMemoryWarning, here.SDL_OnApplicationDidReceiveMemoryWarning.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OnApplicationWillResignActive, here.SDL_OnApplicationWillResignActive.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OnApplicationDidEnterBackground, here.SDL_OnApplicationDidEnterBackground.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OnApplicationWillEnterForeground, here.SDL_OnApplicationWillEnterForeground.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_OnApplicationDidBecomeActive, here.SDL_OnApplicationDidBecomeActive.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LinuxSetThreadPriority, here.SDL_LinuxSetThreadPriority.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_LinuxSetThreadPriorityAndPolicy, here.SDL_LinuxSetThreadPriorityAndPolicy.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/thread.d(88,1)
private nothrow @nogc{
	alias _pSDL_GetThreadName = extern(C) const(char)* function(SDL_Thread* thread);
	alias _pSDL_ThreadID = extern(C) SDL_threadID function();
	alias _pSDL_GetThreadID = extern(C) SDL_threadID function(SDL_Thread* thread);
	alias _pSDL_SetThreadPriority = extern(C) int function(SDL_ThreadPriority priority);
	alias _pSDL_WaitThread = extern(C) void function(SDL_Thread* thread, int* status);
	alias _pSDL_TLSCreate = extern(C) SDL_TLSID function();
	alias _pSDL_TLSGet = extern(C) void* function(SDL_TLSID id);
	alias _pSDL_TLSSet = extern(C) int function(SDL_TLSID id, const(void)* value, TLSDestructor destructor);
	alias _pSDL_CreateThread = extern(C) SDL_Thread* function(SDL_ThreadFunction fn, const(char)* name, void* data);
	alias _pSDL_CreateThreadWithStackSize = extern(C) SDL_Thread* function(SDL_ThreadFunction fn, const(char)* name, const size_t stackSize, void* data);
	alias _pSDL_DetachThread = extern(C) void function(SDL_Thread* thread);
	alias _pSDL_TLSCleanup = extern(C) void function();
}
__gshared nothrow @nogc{
	package _pSDL_GetThreadName _SDL_GetThreadName;
	extern(C) const(char)* SDL_GetThreadName(SDL_Thread* thread){ return _SDL_GetThreadName(__traits(parameters)); }
	package _pSDL_ThreadID _SDL_ThreadID;
	extern(C) SDL_threadID SDL_ThreadID(){ return _SDL_ThreadID(__traits(parameters)); }
	package _pSDL_GetThreadID _SDL_GetThreadID;
	extern(C) SDL_threadID SDL_GetThreadID(SDL_Thread* thread){ return _SDL_GetThreadID(__traits(parameters)); }
	package _pSDL_SetThreadPriority _SDL_SetThreadPriority;
	extern(C) int SDL_SetThreadPriority(SDL_ThreadPriority priority){ return _SDL_SetThreadPriority(__traits(parameters)); }
	package _pSDL_WaitThread _SDL_WaitThread;
	extern(C) void SDL_WaitThread(SDL_Thread* thread, int* status){ _SDL_WaitThread(__traits(parameters)); }
	package _pSDL_TLSCreate _SDL_TLSCreate;
	extern(C) SDL_TLSID SDL_TLSCreate(){ return _SDL_TLSCreate(__traits(parameters)); }
	package _pSDL_TLSGet _SDL_TLSGet;
	extern(C) void* SDL_TLSGet(SDL_TLSID id){ return _SDL_TLSGet(__traits(parameters)); }
	package _pSDL_TLSSet _SDL_TLSSet;
	extern(C) int SDL_TLSSet(SDL_TLSID id, const(void)* value, TLSDestructor destructor){ return _SDL_TLSSet(__traits(parameters)); }
	package _pSDL_CreateThread _SDL_CreateThread;
	extern(C) SDL_Thread* SDL_CreateThread(SDL_ThreadFunction fn, const(char)* name, void* data){ return _SDL_CreateThread(__traits(parameters)); }
	package _pSDL_CreateThreadWithStackSize _SDL_CreateThreadWithStackSize;
	extern(C) SDL_Thread* SDL_CreateThreadWithStackSize(SDL_ThreadFunction fn, const(char)* name, const size_t stackSize, void* data){ return _SDL_CreateThreadWithStackSize(__traits(parameters)); }
	package _pSDL_DetachThread _SDL_DetachThread;
	extern(C) void SDL_DetachThread(SDL_Thread* thread){ _SDL_DetachThread(__traits(parameters)); }
	package _pSDL_TLSCleanup _SDL_TLSCleanup;
	extern(C) void SDL_TLSCleanup(){ _SDL_TLSCleanup(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetThreadName, here.SDL_GetThreadName.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_ThreadID, here.SDL_ThreadID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetThreadID, here.SDL_GetThreadID.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_SetThreadPriority, here.SDL_SetThreadPriority.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WaitThread, here.SDL_WaitThread.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_TLSCreate, here.SDL_TLSCreate.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_TLSGet, here.SDL_TLSGet.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_TLSSet, here.SDL_TLSSet.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateThread, here.SDL_CreateThread.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_CreateThreadWithStackSize, here.SDL_CreateThreadWithStackSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_DetachThread, here.SDL_DetachThread.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_TLSCleanup, here.SDL_TLSCleanup.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/timer.d(22,1)
private nothrow @nogc{
	alias _pSDL_GetTicks = extern(C) uint function();
	alias _pSDL_GetPerformanceCounter = extern(C) ulong function();
	alias _pSDL_GetPerformanceFrequency = extern(C) ulong function();
	alias _pSDL_Delay = extern(C) void function(uint ms);
	alias _pSDL_AddTimer = extern(C) SDL_TimerID function(uint interval, SDL_TimerCallback callback, void* param);
	alias _pSDL_RemoveTimer = extern(C) SDL_bool function(SDL_TimerID id);
	alias _pSDL_GetTicks64 = extern(C) ulong function();
}
__gshared nothrow @nogc{
	package _pSDL_GetTicks _SDL_GetTicks;
	extern(C) uint SDL_GetTicks(){ return _SDL_GetTicks(__traits(parameters)); }
	package _pSDL_GetPerformanceCounter _SDL_GetPerformanceCounter;
	extern(C) ulong SDL_GetPerformanceCounter(){ return _SDL_GetPerformanceCounter(__traits(parameters)); }
	package _pSDL_GetPerformanceFrequency _SDL_GetPerformanceFrequency;
	extern(C) ulong SDL_GetPerformanceFrequency(){ return _SDL_GetPerformanceFrequency(__traits(parameters)); }
	package _pSDL_Delay _SDL_Delay;
	extern(C) void SDL_Delay(uint ms){ _SDL_Delay(__traits(parameters)); }
	package _pSDL_AddTimer _SDL_AddTimer;
	extern(C) SDL_TimerID SDL_AddTimer(uint interval, SDL_TimerCallback callback, void* param){ return _SDL_AddTimer(__traits(parameters)); }
	package _pSDL_RemoveTimer _SDL_RemoveTimer;
	extern(C) SDL_bool SDL_RemoveTimer(SDL_TimerID id){ return _SDL_RemoveTimer(__traits(parameters)); }
	package _pSDL_GetTicks64 _SDL_GetTicks64;
	extern(C) ulong SDL_GetTicks64(){ return _SDL_GetTicks64(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetTicks, here.SDL_GetTicks.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetPerformanceCounter, here.SDL_GetPerformanceCounter.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetPerformanceFrequency, here.SDL_GetPerformanceFrequency.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Delay, here.SDL_Delay.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_AddTimer, here.SDL_AddTimer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_RemoveTimer, here.SDL_RemoveTimer.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetTicks64, here.SDL_GetTicks64.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/version_.d(36,1)
private nothrow @nogc{
	alias _pSDL_GetVersion = extern(C) void function(SDL_version* ver);
	alias _pSDL_GetRevision = extern(C) const(char)* function();
	alias _pSDL_GetRevisionNumber = extern(C) int function();
}
__gshared nothrow @nogc{
	package _pSDL_GetVersion _SDL_GetVersion;
	extern(C) void SDL_GetVersion(SDL_version* ver){ _SDL_GetVersion(__traits(parameters)); }
	package _pSDL_GetRevision _SDL_GetRevision;
	extern(C) const(char)* SDL_GetRevision(){ return _SDL_GetRevision(__traits(parameters)); }
	package _pSDL_GetRevisionNumber _SDL_GetRevisionNumber;
	extern(C) int SDL_GetRevisionNumber(){ return _SDL_GetRevisionNumber(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_GetVersion, here.SDL_GetVersion.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRevision, here.SDL_GetRevision.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_GetRevisionNumber, here.SDL_GetRevisionNumber.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/vulkan.d(16,1)
private nothrow @nogc{
	alias _pSDL_Vulkan_CreateSurface = extern(C) SDL_bool function(SDL_Window* window, void* instance, void* surface);
	alias _pSDL_Vulkan_GetDrawableSize = extern(C) void function(SDL_Window* window, int* w, int* h);
	alias _pSDL_Vulkan_GetInstanceExtensions = extern(C) SDL_bool function(SDL_Window* window, uint* pCount, const(char)** pNames);
	alias _pSDL_Vulkan_GetVkGetInstanceProcAddr = extern(C) void* function();
	alias _pSDL_Vulkan_LoadLibrary = extern(C) int function(const(char)* path);
	alias _pSDL_Vulkan_UnloadLibrary = extern(C) void function();
}
__gshared nothrow @nogc{
	package _pSDL_Vulkan_CreateSurface _SDL_Vulkan_CreateSurface;
	extern(C) SDL_bool SDL_Vulkan_CreateSurface(SDL_Window* window, void* instance, void* surface){ return _SDL_Vulkan_CreateSurface(__traits(parameters)); }
	package _pSDL_Vulkan_GetDrawableSize _SDL_Vulkan_GetDrawableSize;
	extern(C) void SDL_Vulkan_GetDrawableSize(SDL_Window* window, int* w, int* h){ _SDL_Vulkan_GetDrawableSize(__traits(parameters)); }
	package _pSDL_Vulkan_GetInstanceExtensions _SDL_Vulkan_GetInstanceExtensions;
	extern(C) SDL_bool SDL_Vulkan_GetInstanceExtensions(SDL_Window* window, uint* pCount, const(char)** pNames){ return _SDL_Vulkan_GetInstanceExtensions(__traits(parameters)); }
	package _pSDL_Vulkan_GetVkGetInstanceProcAddr _SDL_Vulkan_GetVkGetInstanceProcAddr;
	extern(C) void* SDL_Vulkan_GetVkGetInstanceProcAddr(){ return _SDL_Vulkan_GetVkGetInstanceProcAddr(__traits(parameters)); }
	package _pSDL_Vulkan_LoadLibrary _SDL_Vulkan_LoadLibrary;
	extern(C) int SDL_Vulkan_LoadLibrary(const(char)* path){ return _SDL_Vulkan_LoadLibrary(__traits(parameters)); }
	package _pSDL_Vulkan_UnloadLibrary _SDL_Vulkan_UnloadLibrary;
	extern(C) void SDL_Vulkan_UnloadLibrary(){ _SDL_Vulkan_UnloadLibrary(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_Vulkan_CreateSurface, here.SDL_Vulkan_CreateSurface.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Vulkan_GetDrawableSize, here.SDL_Vulkan_GetDrawableSize.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Vulkan_GetInstanceExtensions, here.SDL_Vulkan_GetInstanceExtensions.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Vulkan_GetVkGetInstanceProcAddr, here.SDL_Vulkan_GetVkGetInstanceProcAddr.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Vulkan_LoadLibrary, here.SDL_Vulkan_LoadLibrary.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Vulkan_UnloadLibrary, here.SDL_Vulkan_UnloadLibrary.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/package.d(89,1)
private nothrow @nogc{
	alias _pSDL_Init = extern(C) int function(uint flags);
	alias _pSDL_InitSubSystem = extern(C) int function(uint flags);
	alias _pSDL_QuitSubSystem = extern(C) void function(uint flags);
	alias _pSDL_WasInit = extern(C) uint function(uint flags);
	alias _pSDL_Quit = extern(C) void function();
}
__gshared nothrow @nogc{
	package _pSDL_Init _SDL_Init;
	extern(C) int SDL_Init(uint flags){ return _SDL_Init(__traits(parameters)); }
	package _pSDL_InitSubSystem _SDL_InitSubSystem;
	extern(C) int SDL_InitSubSystem(uint flags){ return _SDL_InitSubSystem(__traits(parameters)); }
	package _pSDL_QuitSubSystem _SDL_QuitSubSystem;
	extern(C) void SDL_QuitSubSystem(uint flags){ _SDL_QuitSubSystem(__traits(parameters)); }
	package _pSDL_WasInit _SDL_WasInit;
	extern(C) uint SDL_WasInit(uint flags){ return _SDL_WasInit(__traits(parameters)); }
	package _pSDL_Quit _SDL_Quit;
	extern(C) void SDL_Quit(){ _SDL_Quit(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_SDL_Init, here.SDL_Init.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_InitSubSystem, here.SDL_InitSubSystem.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_QuitSubSystem, here.SDL_QuitSubSystem.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_WasInit, here.SDL_WasInit.mangleof);
	lib.bindSymbol(cast(void**)&_SDL_Quit, here.SDL_Quit.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl/package.d(133,1)

void unloadSDL(){ if(lib != invalidHandle) lib.unload(); }

bool isSDLLoaded(){ return lib != invalidHandle; }

SDLSupport loadSDL(){
	const(char)[][libNamesCT.length] libNames = libNamesCT;
	
	SDLSupport ret;
	foreach(name; libNames){
		ret = loadSDL(name.ptr);
		//TODO: keep trying until we get the version we want, otherwise default to the highest one?
		if(ret != SDLSupport.noLibrary && ret != SDLSupport.badLibrary) break;
	}
	return ret;
}

SDLSupport loadSDL(const(char)* libName){
	lib = bindbc.loader.load(libName);
	if(lib == invalidHandle){
		return SDLSupport.noLibrary;
	}
	
	auto errCount = errorCount();
	loadedVersion = SDLSupport.badLibrary;

	sdl.bindModuleSymbols(lib);
	sdl.assert_.bindModuleSymbols(lib);
	sdl.atomic.bindModuleSymbols(lib);
	sdl.audio.bindModuleSymbols(lib);
	sdl.blendmode.bindModuleSymbols(lib);
	sdl.clipboard.bindModuleSymbols(lib);
	sdl.cpuinfo.bindModuleSymbols(lib);
	sdl.error.bindModuleSymbols(lib);
	sdl.events.bindModuleSymbols(lib);
	sdl.filesystem.bindModuleSymbols(lib);
	sdl.gamecontroller.bindModuleSymbols(lib);
	sdl.gesture.bindModuleSymbols(lib);
	sdl.guid.bindModuleSymbols(lib);
	sdl.haptic.bindModuleSymbols(lib);
	sdl.hidapi.bindModuleSymbols(lib);
	sdl.hints.bindModuleSymbols(lib);
	sdl.joystick.bindModuleSymbols(lib);
	sdl.keyboard.bindModuleSymbols(lib);
	sdl.loadso.bindModuleSymbols(lib);
	sdl.locale.bindModuleSymbols(lib);
	sdl.log.bindModuleSymbols(lib);
	sdl.messagebox.bindModuleSymbols(lib);
	sdl.metal.bindModuleSymbols(lib);
	sdl.misc.bindModuleSymbols(lib);
	sdl.mouse.bindModuleSymbols(lib);
	sdl.mutex.bindModuleSymbols(lib);
	sdl.pixels.bindModuleSymbols(lib);
	sdl.platform.bindModuleSymbols(lib);
	sdl.power.bindModuleSymbols(lib);
	sdl.rect.bindModuleSymbols(lib);
	sdl.render.bindModuleSymbols(lib);
	sdl.rwops.bindModuleSymbols(lib);
	sdl.sensor.bindModuleSymbols(lib);
	sdl.shape.bindModuleSymbols(lib);
	sdl.stdinc.bindModuleSymbols(lib);
	sdl.surface.bindModuleSymbols(lib);
	sdl.system.bindModuleSymbols(lib);
	sdl.syswm.bindModuleSymbols(lib);
	sdl.thread.bindModuleSymbols(lib);
	sdl.timer.bindModuleSymbols(lib);
	sdl.touch.bindModuleSymbols(lib);
	sdl.version_.bindModuleSymbols(lib);
	sdl.video.bindModuleSymbols(lib);
	sdl.vulkan.bindModuleSymbols(lib);
	
	if(errCount == errorCount()) loadedVersion = sdlSupport; //this is a white-lie in order to maintain backwards-compatibility :(
	return loadedVersion;
}

// expansion at deps/bindbc-sdl/source/sdl_image.d(95,1)
private nothrow @nogc{
	alias _pIMG_Init = extern(C) int function(int flags);
	alias _pIMG_Quit = extern(C) int function();
	alias _pIMG_Linked_Version = extern(C) const(SDL_version)* function();
	alias _pIMG_LoadTyped_RW = extern(C) SDL_Surface* function(SDL_RWops* src, int freeSrc, const(char)* type);
	alias _pIMG_Load = extern(C) SDL_Surface* function(const(char)* file);
	alias _pIMG_Load_RW = extern(C) SDL_Surface* function(SDL_RWops* src, int freeSrc);
	alias _pIMG_LoadTexture = extern(C) SDL_Texture* function(SDL_Renderer* renderer, const(char)* file);
	alias _pIMG_LoadTexture_RW = extern(C) SDL_Texture* function(SDL_Renderer* renderer, SDL_RWops* src, int freeSrc);
	alias _pIMG_LoadTextureTyped_RW = extern(C) SDL_Texture* function(SDL_Renderer* renderer, SDL_RWops* src, int freeSrc, const(char)* type);
	alias _pIMG_isICO = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isCUR = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isBMP = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isGIF = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isJPG = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isLBM = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isPCX = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isPNG = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isPNM = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isTIF = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isXCF = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isXPM = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isXV = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isWEBP = extern(C) int function(SDL_RWops* src);
	alias _pIMG_LoadICO_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadCUR_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadBMP_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadGIF_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadJPG_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadLBM_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadPCX_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadPNG_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadPNM_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadTGA_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadTIF_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadXCF_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadXPM_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadXV_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadWEBP_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_ReadXPMFromArray = extern(C) SDL_Surface* function(char** xpm);
	alias _pIMG_SavePNG = extern(C) int function(SDL_Surface* surface, const(char)* file);
	alias _pIMG_SavePNG_RW = extern(C) int function(SDL_Surface* surface, SDL_RWops* dst, int freeDst);
	alias _pIMG_isSVG = extern(C) int function(SDL_RWops* src);
	alias _pIMG_LoadSVG_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_SaveJPG = extern(C) int function(SDL_Surface* surface, const(char)* file, int quality);
	alias _pIMG_SaveJPG_RW = extern(C) int function(SDL_Surface* surface, SDL_RWops* dst, int freeDst, int quality);
	alias _pIMG_isAVIF = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isJXL = extern(C) int function(SDL_RWops* src);
	alias _pIMG_isQOI = extern(C) int function(SDL_RWops* src);
	alias _pIMG_LoadAVIF_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadJXL_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadQOI_RW = extern(C) SDL_Surface* function(SDL_RWops* src);
	alias _pIMG_LoadSizedSVG_RW = extern(C) SDL_Surface* function(SDL_RWops* src, int width, int height);
	alias _pIMG_ReadXPMFromArrayToRGB888 = extern(C) SDL_Surface* function(char** xpm);
	alias _pIMG_LoadAnimation = extern(C) IMG_Animation* function(const(char)* file);
	alias _pIMG_LoadAnimation_RW = extern(C) IMG_Animation* function(SDL_RWops* src, int freeSrc);
	alias _pIMG_LoadAnimationTyped_RW = extern(C) IMG_Animation* function(SDL_RWops* src, int freeSrc, const(char)* type);
	alias _pIMG_FreeAnimation = extern(C) void function(IMG_Animation* anim);
	alias _pIMG_LoadGIFAnimation_RW = extern(C) IMG_Animation* function(SDL_RWops* src);
}
__gshared nothrow @nogc{
	package _pIMG_Init _IMG_Init;
	extern(C) int IMG_Init(int flags){ return _IMG_Init(__traits(parameters)); }
	package _pIMG_Quit _IMG_Quit;
	extern(C) int IMG_Quit(){ return _IMG_Quit(__traits(parameters)); }
	package _pIMG_Linked_Version _IMG_Linked_Version;
	extern(C) const(SDL_version)* IMG_Linked_Version(){ return _IMG_Linked_Version(__traits(parameters)); }
	package _pIMG_LoadTyped_RW _IMG_LoadTyped_RW;
	extern(C) SDL_Surface* IMG_LoadTyped_RW(SDL_RWops* src, int freeSrc, const(char)* type){ return _IMG_LoadTyped_RW(__traits(parameters)); }
	package _pIMG_Load _IMG_Load;
	extern(C) SDL_Surface* IMG_Load(const(char)* file){ return _IMG_Load(__traits(parameters)); }
	package _pIMG_Load_RW _IMG_Load_RW;
	extern(C) SDL_Surface* IMG_Load_RW(SDL_RWops* src, int freeSrc){ return _IMG_Load_RW(__traits(parameters)); }
	package _pIMG_LoadTexture _IMG_LoadTexture;
	extern(C) SDL_Texture* IMG_LoadTexture(SDL_Renderer* renderer, const(char)* file){ return _IMG_LoadTexture(__traits(parameters)); }
	package _pIMG_LoadTexture_RW _IMG_LoadTexture_RW;
	extern(C) SDL_Texture* IMG_LoadTexture_RW(SDL_Renderer* renderer, SDL_RWops* src, int freeSrc){ return _IMG_LoadTexture_RW(__traits(parameters)); }
	package _pIMG_LoadTextureTyped_RW _IMG_LoadTextureTyped_RW;
	extern(C) SDL_Texture* IMG_LoadTextureTyped_RW(SDL_Renderer* renderer, SDL_RWops* src, int freeSrc, const(char)* type){ return _IMG_LoadTextureTyped_RW(__traits(parameters)); }
	package _pIMG_isICO _IMG_isICO;
	extern(C) int IMG_isICO(SDL_RWops* src){ return _IMG_isICO(__traits(parameters)); }
	package _pIMG_isCUR _IMG_isCUR;
	extern(C) int IMG_isCUR(SDL_RWops* src){ return _IMG_isCUR(__traits(parameters)); }
	package _pIMG_isBMP _IMG_isBMP;
	extern(C) int IMG_isBMP(SDL_RWops* src){ return _IMG_isBMP(__traits(parameters)); }
	package _pIMG_isGIF _IMG_isGIF;
	extern(C) int IMG_isGIF(SDL_RWops* src){ return _IMG_isGIF(__traits(parameters)); }
	package _pIMG_isJPG _IMG_isJPG;
	extern(C) int IMG_isJPG(SDL_RWops* src){ return _IMG_isJPG(__traits(parameters)); }
	package _pIMG_isLBM _IMG_isLBM;
	extern(C) int IMG_isLBM(SDL_RWops* src){ return _IMG_isLBM(__traits(parameters)); }
	package _pIMG_isPCX _IMG_isPCX;
	extern(C) int IMG_isPCX(SDL_RWops* src){ return _IMG_isPCX(__traits(parameters)); }
	package _pIMG_isPNG _IMG_isPNG;
	extern(C) int IMG_isPNG(SDL_RWops* src){ return _IMG_isPNG(__traits(parameters)); }
	package _pIMG_isPNM _IMG_isPNM;
	extern(C) int IMG_isPNM(SDL_RWops* src){ return _IMG_isPNM(__traits(parameters)); }
	package _pIMG_isTIF _IMG_isTIF;
	extern(C) int IMG_isTIF(SDL_RWops* src){ return _IMG_isTIF(__traits(parameters)); }
	package _pIMG_isXCF _IMG_isXCF;
	extern(C) int IMG_isXCF(SDL_RWops* src){ return _IMG_isXCF(__traits(parameters)); }
	package _pIMG_isXPM _IMG_isXPM;
	extern(C) int IMG_isXPM(SDL_RWops* src){ return _IMG_isXPM(__traits(parameters)); }
	package _pIMG_isXV _IMG_isXV;
	extern(C) int IMG_isXV(SDL_RWops* src){ return _IMG_isXV(__traits(parameters)); }
	package _pIMG_isWEBP _IMG_isWEBP;
	extern(C) int IMG_isWEBP(SDL_RWops* src){ return _IMG_isWEBP(__traits(parameters)); }
	package _pIMG_LoadICO_RW _IMG_LoadICO_RW;
	extern(C) SDL_Surface* IMG_LoadICO_RW(SDL_RWops* src){ return _IMG_LoadICO_RW(__traits(parameters)); }
	package _pIMG_LoadCUR_RW _IMG_LoadCUR_RW;
	extern(C) SDL_Surface* IMG_LoadCUR_RW(SDL_RWops* src){ return _IMG_LoadCUR_RW(__traits(parameters)); }
	package _pIMG_LoadBMP_RW _IMG_LoadBMP_RW;
	extern(C) SDL_Surface* IMG_LoadBMP_RW(SDL_RWops* src){ return _IMG_LoadBMP_RW(__traits(parameters)); }
	package _pIMG_LoadGIF_RW _IMG_LoadGIF_RW;
	extern(C) SDL_Surface* IMG_LoadGIF_RW(SDL_RWops* src){ return _IMG_LoadGIF_RW(__traits(parameters)); }
	package _pIMG_LoadJPG_RW _IMG_LoadJPG_RW;
	extern(C) SDL_Surface* IMG_LoadJPG_RW(SDL_RWops* src){ return _IMG_LoadJPG_RW(__traits(parameters)); }
	package _pIMG_LoadLBM_RW _IMG_LoadLBM_RW;
	extern(C) SDL_Surface* IMG_LoadLBM_RW(SDL_RWops* src){ return _IMG_LoadLBM_RW(__traits(parameters)); }
	package _pIMG_LoadPCX_RW _IMG_LoadPCX_RW;
	extern(C) SDL_Surface* IMG_LoadPCX_RW(SDL_RWops* src){ return _IMG_LoadPCX_RW(__traits(parameters)); }
	package _pIMG_LoadPNG_RW _IMG_LoadPNG_RW;
	extern(C) SDL_Surface* IMG_LoadPNG_RW(SDL_RWops* src){ return _IMG_LoadPNG_RW(__traits(parameters)); }
	package _pIMG_LoadPNM_RW _IMG_LoadPNM_RW;
	extern(C) SDL_Surface* IMG_LoadPNM_RW(SDL_RWops* src){ return _IMG_LoadPNM_RW(__traits(parameters)); }
	package _pIMG_LoadTGA_RW _IMG_LoadTGA_RW;
	extern(C) SDL_Surface* IMG_LoadTGA_RW(SDL_RWops* src){ return _IMG_LoadTGA_RW(__traits(parameters)); }
	package _pIMG_LoadTIF_RW _IMG_LoadTIF_RW;
	extern(C) SDL_Surface* IMG_LoadTIF_RW(SDL_RWops* src){ return _IMG_LoadTIF_RW(__traits(parameters)); }
	package _pIMG_LoadXCF_RW _IMG_LoadXCF_RW;
	extern(C) SDL_Surface* IMG_LoadXCF_RW(SDL_RWops* src){ return _IMG_LoadXCF_RW(__traits(parameters)); }
	package _pIMG_LoadXPM_RW _IMG_LoadXPM_RW;
	extern(C) SDL_Surface* IMG_LoadXPM_RW(SDL_RWops* src){ return _IMG_LoadXPM_RW(__traits(parameters)); }
	package _pIMG_LoadXV_RW _IMG_LoadXV_RW;
	extern(C) SDL_Surface* IMG_LoadXV_RW(SDL_RWops* src){ return _IMG_LoadXV_RW(__traits(parameters)); }
	package _pIMG_LoadWEBP_RW _IMG_LoadWEBP_RW;
	extern(C) SDL_Surface* IMG_LoadWEBP_RW(SDL_RWops* src){ return _IMG_LoadWEBP_RW(__traits(parameters)); }
	package _pIMG_ReadXPMFromArray _IMG_ReadXPMFromArray;
	extern(C) SDL_Surface* IMG_ReadXPMFromArray(char** xpm){ return _IMG_ReadXPMFromArray(__traits(parameters)); }
	package _pIMG_SavePNG _IMG_SavePNG;
	extern(C) int IMG_SavePNG(SDL_Surface* surface, const(char)* file){ return _IMG_SavePNG(__traits(parameters)); }
	package _pIMG_SavePNG_RW _IMG_SavePNG_RW;
	extern(C) int IMG_SavePNG_RW(SDL_Surface* surface, SDL_RWops* dst, int freeDst){ return _IMG_SavePNG_RW(__traits(parameters)); }
	package _pIMG_isSVG _IMG_isSVG;
	extern(C) int IMG_isSVG(SDL_RWops* src){ return _IMG_isSVG(__traits(parameters)); }
	package _pIMG_LoadSVG_RW _IMG_LoadSVG_RW;
	extern(C) SDL_Surface* IMG_LoadSVG_RW(SDL_RWops* src){ return _IMG_LoadSVG_RW(__traits(parameters)); }
	package _pIMG_SaveJPG _IMG_SaveJPG;
	extern(C) int IMG_SaveJPG(SDL_Surface* surface, const(char)* file, int quality){ return _IMG_SaveJPG(__traits(parameters)); }
	package _pIMG_SaveJPG_RW _IMG_SaveJPG_RW;
	extern(C) int IMG_SaveJPG_RW(SDL_Surface* surface, SDL_RWops* dst, int freeDst, int quality){ return _IMG_SaveJPG_RW(__traits(parameters)); }
	package _pIMG_isAVIF _IMG_isAVIF;
	extern(C) int IMG_isAVIF(SDL_RWops* src){ return _IMG_isAVIF(__traits(parameters)); }
	package _pIMG_isJXL _IMG_isJXL;
	extern(C) int IMG_isJXL(SDL_RWops* src){ return _IMG_isJXL(__traits(parameters)); }
	package _pIMG_isQOI _IMG_isQOI;
	extern(C) int IMG_isQOI(SDL_RWops* src){ return _IMG_isQOI(__traits(parameters)); }
	package _pIMG_LoadAVIF_RW _IMG_LoadAVIF_RW;
	extern(C) SDL_Surface* IMG_LoadAVIF_RW(SDL_RWops* src){ return _IMG_LoadAVIF_RW(__traits(parameters)); }
	package _pIMG_LoadJXL_RW _IMG_LoadJXL_RW;
	extern(C) SDL_Surface* IMG_LoadJXL_RW(SDL_RWops* src){ return _IMG_LoadJXL_RW(__traits(parameters)); }
	package _pIMG_LoadQOI_RW _IMG_LoadQOI_RW;
	extern(C) SDL_Surface* IMG_LoadQOI_RW(SDL_RWops* src){ return _IMG_LoadQOI_RW(__traits(parameters)); }
	package _pIMG_LoadSizedSVG_RW _IMG_LoadSizedSVG_RW;
	extern(C) SDL_Surface* IMG_LoadSizedSVG_RW(SDL_RWops* src, int width, int height){ return _IMG_LoadSizedSVG_RW(__traits(parameters)); }
	package _pIMG_ReadXPMFromArrayToRGB888 _IMG_ReadXPMFromArrayToRGB888;
	extern(C) SDL_Surface* IMG_ReadXPMFromArrayToRGB888(char** xpm){ return _IMG_ReadXPMFromArrayToRGB888(__traits(parameters)); }
	package _pIMG_LoadAnimation _IMG_LoadAnimation;
	extern(C) IMG_Animation* IMG_LoadAnimation(const(char)* file){ return _IMG_LoadAnimation(__traits(parameters)); }
	package _pIMG_LoadAnimation_RW _IMG_LoadAnimation_RW;
	extern(C) IMG_Animation* IMG_LoadAnimation_RW(SDL_RWops* src, int freeSrc){ return _IMG_LoadAnimation_RW(__traits(parameters)); }
	package _pIMG_LoadAnimationTyped_RW _IMG_LoadAnimationTyped_RW;
	extern(C) IMG_Animation* IMG_LoadAnimationTyped_RW(SDL_RWops* src, int freeSrc, const(char)* type){ return _IMG_LoadAnimationTyped_RW(__traits(parameters)); }
	package _pIMG_FreeAnimation _IMG_FreeAnimation;
	extern(C) void IMG_FreeAnimation(IMG_Animation* anim){ _IMG_FreeAnimation(__traits(parameters)); }
	package _pIMG_LoadGIFAnimation_RW _IMG_LoadGIFAnimation_RW;
	extern(C) IMG_Animation* IMG_LoadGIFAnimation_RW(SDL_RWops* src){ return _IMG_LoadGIFAnimation_RW(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_IMG_Init, here.IMG_Init.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_Quit, here.IMG_Quit.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_Linked_Version, here.IMG_Linked_Version.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadTyped_RW, here.IMG_LoadTyped_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_Load, here.IMG_Load.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_Load_RW, here.IMG_Load_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadTexture, here.IMG_LoadTexture.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadTexture_RW, here.IMG_LoadTexture_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadTextureTyped_RW, here.IMG_LoadTextureTyped_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isICO, here.IMG_isICO.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isCUR, here.IMG_isCUR.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isBMP, here.IMG_isBMP.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isGIF, here.IMG_isGIF.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isJPG, here.IMG_isJPG.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isLBM, here.IMG_isLBM.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isPCX, here.IMG_isPCX.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isPNG, here.IMG_isPNG.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isPNM, here.IMG_isPNM.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isTIF, here.IMG_isTIF.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isXCF, here.IMG_isXCF.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isXPM, here.IMG_isXPM.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isXV, here.IMG_isXV.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isWEBP, here.IMG_isWEBP.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadICO_RW, here.IMG_LoadICO_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadCUR_RW, here.IMG_LoadCUR_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadBMP_RW, here.IMG_LoadBMP_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadGIF_RW, here.IMG_LoadGIF_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadJPG_RW, here.IMG_LoadJPG_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadLBM_RW, here.IMG_LoadLBM_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadPCX_RW, here.IMG_LoadPCX_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadPNG_RW, here.IMG_LoadPNG_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadPNM_RW, here.IMG_LoadPNM_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadTGA_RW, here.IMG_LoadTGA_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadTIF_RW, here.IMG_LoadTIF_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadXCF_RW, here.IMG_LoadXCF_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadXPM_RW, here.IMG_LoadXPM_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadXV_RW, here.IMG_LoadXV_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadWEBP_RW, here.IMG_LoadWEBP_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_ReadXPMFromArray, here.IMG_ReadXPMFromArray.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_SavePNG, here.IMG_SavePNG.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_SavePNG_RW, here.IMG_SavePNG_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isSVG, here.IMG_isSVG.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadSVG_RW, here.IMG_LoadSVG_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_SaveJPG, here.IMG_SaveJPG.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_SaveJPG_RW, here.IMG_SaveJPG_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isAVIF, here.IMG_isAVIF.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isJXL, here.IMG_isJXL.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_isQOI, here.IMG_isQOI.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadAVIF_RW, here.IMG_LoadAVIF_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadJXL_RW, here.IMG_LoadJXL_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadQOI_RW, here.IMG_LoadQOI_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadSizedSVG_RW, here.IMG_LoadSizedSVG_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_ReadXPMFromArrayToRGB888, here.IMG_ReadXPMFromArrayToRGB888.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadAnimation, here.IMG_LoadAnimation.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadAnimation_RW, here.IMG_LoadAnimation_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadAnimationTyped_RW, here.IMG_LoadAnimationTyped_RW.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_FreeAnimation, here.IMG_FreeAnimation.mangleof);
	lib.bindSymbol(cast(void**)&_IMG_LoadGIFAnimation_RW, here.IMG_LoadGIFAnimation_RW.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl_image.d(209,1)

void unloadSDLImage(){ if(lib != invalidHandle) lib.unload(); }

bool isSDLImageLoaded(){ return lib != invalidHandle; }

SDLImageSupport loadSDLImage(){
	const(char)[][libNamesCT.length] libNames = libNamesCT;
	
	SDLImageSupport ret;
	foreach(name; libNames){
		ret = loadSDLImage(name.ptr);
		//TODO: keep trying until we get the version we want, otherwise default to the highest one?
		if(ret != SDLImageSupport.noLibrary && ret != SDLImageSupport.badLibrary) break;
	}
	return ret;
}

SDLImageSupport loadSDLImage(const(char)* libName){
	lib = bindbc.loader.load(libName);
	if(lib == invalidHandle){
		return SDLImageSupport.noLibrary;
	}
	
	auto errCount = errorCount();
	loadedVersion = SDLImageSupport.badLibrary;

	sdl_image.bindModuleSymbols(lib);
	
	if(errCount == errorCount()) loadedVersion = sdlImageSupport; //this is a white-lie in order to maintain backwards-compatibility :(
	return loadedVersion;
}

// expansion at deps/bindbc-sdl/source/sdl_ttf.d(111,1)
private nothrow @nogc{
	alias _pTTF_Linked_Version = extern(C) SDL_version* function();
	alias _pTTF_ByteSwappedUNICODE = extern(C) void function(int swapped);
	alias _pTTF_Init = extern(C) int function();
	alias _pTTF_OpenFont = extern(C) TTF_Font* function(const(char)* file, int ptSize);
	alias _pTTF_OpenFontIndex = extern(C) TTF_Font* function(const(char)* file, int ptSize, c_long index);
	alias _pTTF_OpenFontRW = extern(C) TTF_Font* function(SDL_RWops* src, int freeSrc, int ptSize);
	alias _pTTF_OpenFontIndexRW = extern(C) TTF_Font* function(SDL_RWops* src, int freeSrc, int ptSize, c_long index);
	alias _pTTF_GetFontStyle = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_SetFontStyle = extern(C) void function(const(TTF_Font)* font, int style);
	alias _pTTF_GetFontOutline = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_SetFontOutline = extern(C) void function(TTF_Font* font, int outline);
	alias _pTTF_GetFontHinting = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_SetFontHinting = extern(C) void function(TTF_Font* font, int hinting);
	alias _pTTF_FontHeight = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_FontAscent = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_FontDescent = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_FontLineSkip = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_GetFontKerning = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_SetFontKerning = extern(C) void function(TTF_Font* font, int allowed);
	alias _pTTF_FontFaces = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_FontFaceIsFixedWidth = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_FontFaceFamilyName = extern(C) char* function(const(TTF_Font)* font);
	alias _pTTF_FontFaceStyleName = extern(C) char* function(const(TTF_Font)* font);
	alias _pTTF_GlyphIsProvided = extern(C) int function(const(TTF_Font)* font, ushort ch);
	alias _pTTF_GlyphMetrics = extern(C) int function(TTF_Font* font, ushort ch, int* minX, int* maxX, int* minY, int* maxY, int* advance);
	alias _pTTF_SizeText = extern(C) int function(TTF_Font* font, const(char)* text, int* w, int* h);
	alias _pTTF_SizeUTF8 = extern(C) int function(TTF_Font* font, const(char)* text, int* w, int* h);
	alias _pTTF_SizeUNICODE = extern(C) int function(TTF_Font* font, const(ushort)* text, int* w, int* h);
	alias _pTTF_RenderText_Solid = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg);
	alias _pTTF_RenderUTF8_Solid = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg);
	alias _pTTF_RenderUNICODE_Solid = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg);
	alias _pTTF_RenderGlyph_Solid = extern(C) SDL_Surface* function(TTF_Font* font, ushort ch, SDL_Color fg);
	alias _pTTF_RenderText_Shaded = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderUTF8_Shaded = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderUNICODE_Shaded = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderGlyph_Shaded = extern(C) SDL_Surface* function(TTF_Font* font, ushort ch, SDL_Color fg,SDL_Color bg);
	alias _pTTF_RenderText_Blended = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg);
	alias _pTTF_RenderUTF8_Blended = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg);
	alias _pTTF_RenderUNICODE_Blended = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg);
	alias _pTTF_RenderText_Blended_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength);
	alias _pTTF_RenderUTF8_Blended_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength);
	alias _pTTF_RenderUNICODE_Blended_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg, uint wrapLength);
	alias _pTTF_RenderGlyph_Blended = extern(C) SDL_Surface* function(TTF_Font* font, ushort ch, SDL_Color fg);
	alias _pTTF_CloseFont = extern(C) void function(TTF_Font* font);
	alias _pTTF_Quit = extern(C) void function();
	alias _pTTF_WasInit = extern(C) int function();
	alias _pTTF_GetFontKerningSize = extern(C) int function(TTF_Font* font, int prevIndex, int index);
	alias _pTTF_GetFontKerningSizeGlyphs = extern(C) int function(TTF_Font* font, ushort previousCh, ushort ch);
	alias _pTTF_GetFreeTypeVersion = extern(C) void function(int* major, int* minor, int* patch);
	alias _pTTF_GetHarfBuzzVersion = extern(C) void function(int* major, int* minor, int* patch);
	alias _pTTF_SetFontSDF = extern(C) int function(TTF_Font* font, SDL_bool on_off);
	alias _pTTF_GetFontSDF = extern(C) SDL_bool function(const(TTF_Font)* font);
	alias _pTTF_OpenFontDPI = extern(C) TTF_Font* function(const(char)* file, int ptSize, uint hdpi, uint vdpi);
	alias _pTTF_OpenFontIndexDPI = extern(C) TTF_Font* function(const(char)*file, int ptSize, long index, uint hdpi, uint vdpi);
	alias _pTTF_OpenFontDPIRW = extern(C) TTF_Font* function(SDL_RWops* src, int freeSrc, int ptsize, uint hdpi, uint vdpi);
	alias _pTTF_OpenFontIndexDPIRW = extern(C) TTF_Font* function(SDL_RWops* src, int freeSrc, int ptSize, long index, uint hdpi, uint vdpi);
	alias _pTTF_SetFontSizeDPI = extern(C) int function(TTF_Font* font, int ptsize, uint hdpi, uint vdpi);
	alias _pTTF_GlyphIsProvided32 = extern(C) int function(TTF_Font* font, uint ch);
	alias _pTTF_GlyphMetrics32 = extern(C) int function(TTF_Font* font, uint ch, int* minx, int* maxx, int* miny, int* maxy, int* advance);
	alias _pTTF_RenderGlyph32_Solid = extern(C) SDL_Surface* function(TTF_Font* font, uint ch, SDL_Color fg);
	alias _pTTF_RenderGlyph32_Shaded = extern(C) SDL_Surface* function(TTF_Font* font, uint ch, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderGlyph32_Blended = extern(C) SDL_Surface* function(TTF_Font* font, uint ch, SDL_Color fg);
	alias _pTTF_GetFontKerningSizeGlyphs32 = extern(C) int function(TTF_Font* font, uint previousCh, uint ch);
	alias _pTTF_SetDirection = extern(C) int function(int direction);
	alias _pTTF_SetScript = extern(C) int function(int script);
	alias _pTTF_MeasureText = extern(C) int function(TTF_Font* font, const(char)* text, int measureWidth, int* extent, int* count);
	alias _pTTF_MeasureUTF8 = extern(C) int function(TTF_Font* font, const(char)* text, int measureWidth, int* extent, int* count);
	alias _pTTF_MeasureUNICODE = extern(C) int function(TTF_Font* font, const(ushort)* text, int measureWidth, int* extent, int* count);
	alias _pTTF_SetFontSize = extern(C) int function(TTF_Font* font, int ptsize);
	alias _pTTF_RenderText_Solid_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength);
	alias _pTTF_RenderUTF8_Solid_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength);
	alias _pTTF_RenderUNICODE_Solid_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg, uint wrapLength);
	alias _pTTF_RenderText_Shaded_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength);
	alias _pTTF_RenderUTF8_Shaded_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength);
	alias _pTTF_RenderUNICODE_Shaded_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg, uint wrapLength);
	alias _pTTF_GetFontWrappedAlign = extern(C) int function(const(TTF_Font)* font);
	alias _pTTF_SetFontWrappedAlign = extern(C) void function(TTF_Font* font, int align_);
	alias _pTTF_RenderText_LCD = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderUTF8_LCD = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderUNICODE_LCD = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderText_LCD_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength);
	alias _pTTF_RenderUTF8_LCD_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength);
	alias _pTTF_RenderUNICODE_LCD_Wrapped = extern(C) SDL_Surface* function(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg, uint wrapLength);
	alias _pTTF_RenderGlyph_LCD = extern(C) SDL_Surface* function(TTF_Font* font, ushort ch, SDL_Color fg, SDL_Color bg);
	alias _pTTF_RenderGlyph32_LCD = extern(C) SDL_Surface* function(TTF_Font* font, uint ch, SDL_Color fg, SDL_Color bg);
	alias _pTTF_SetFontDirection = extern(C) int function(TTF_Font* font, TTF_Direction direction);
	alias _pTTF_SetFontScriptName = extern(C) int function(TTF_Font* font, const(char)* script);
}
__gshared nothrow @nogc{
	package _pTTF_Linked_Version _TTF_Linked_Version;
	extern(C) SDL_version* TTF_Linked_Version(){ return _TTF_Linked_Version(__traits(parameters)); }
	package _pTTF_ByteSwappedUNICODE _TTF_ByteSwappedUNICODE;
	extern(C) void TTF_ByteSwappedUNICODE(int swapped){ _TTF_ByteSwappedUNICODE(__traits(parameters)); }
	package _pTTF_Init _TTF_Init;
	extern(C) int TTF_Init(){ return _TTF_Init(__traits(parameters)); }
	package _pTTF_OpenFont _TTF_OpenFont;
	extern(C) TTF_Font* TTF_OpenFont(const(char)* file, int ptSize){ return _TTF_OpenFont(__traits(parameters)); }
	package _pTTF_OpenFontIndex _TTF_OpenFontIndex;
	extern(C) TTF_Font* TTF_OpenFontIndex(const(char)* file, int ptSize, c_long index){ return _TTF_OpenFontIndex(__traits(parameters)); }
	package _pTTF_OpenFontRW _TTF_OpenFontRW;
	extern(C) TTF_Font* TTF_OpenFontRW(SDL_RWops* src, int freeSrc, int ptSize){ return _TTF_OpenFontRW(__traits(parameters)); }
	package _pTTF_OpenFontIndexRW _TTF_OpenFontIndexRW;
	extern(C) TTF_Font* TTF_OpenFontIndexRW(SDL_RWops* src, int freeSrc, int ptSize, c_long index){ return _TTF_OpenFontIndexRW(__traits(parameters)); }
	package _pTTF_GetFontStyle _TTF_GetFontStyle;
	extern(C) int TTF_GetFontStyle(const(TTF_Font)* font){ return _TTF_GetFontStyle(__traits(parameters)); }
	package _pTTF_SetFontStyle _TTF_SetFontStyle;
	extern(C) void TTF_SetFontStyle(const(TTF_Font)* font, int style){ _TTF_SetFontStyle(__traits(parameters)); }
	package _pTTF_GetFontOutline _TTF_GetFontOutline;
	extern(C) int TTF_GetFontOutline(const(TTF_Font)* font){ return _TTF_GetFontOutline(__traits(parameters)); }
	package _pTTF_SetFontOutline _TTF_SetFontOutline;
	extern(C) void TTF_SetFontOutline(TTF_Font* font, int outline){ _TTF_SetFontOutline(__traits(parameters)); }
	package _pTTF_GetFontHinting _TTF_GetFontHinting;
	extern(C) int TTF_GetFontHinting(const(TTF_Font)* font){ return _TTF_GetFontHinting(__traits(parameters)); }
	package _pTTF_SetFontHinting _TTF_SetFontHinting;
	extern(C) void TTF_SetFontHinting(TTF_Font* font, int hinting){ _TTF_SetFontHinting(__traits(parameters)); }
	package _pTTF_FontHeight _TTF_FontHeight;
	extern(C) int TTF_FontHeight(const(TTF_Font)* font){ return _TTF_FontHeight(__traits(parameters)); }
	package _pTTF_FontAscent _TTF_FontAscent;
	extern(C) int TTF_FontAscent(const(TTF_Font)* font){ return _TTF_FontAscent(__traits(parameters)); }
	package _pTTF_FontDescent _TTF_FontDescent;
	extern(C) int TTF_FontDescent(const(TTF_Font)* font){ return _TTF_FontDescent(__traits(parameters)); }
	package _pTTF_FontLineSkip _TTF_FontLineSkip;
	extern(C) int TTF_FontLineSkip(const(TTF_Font)* font){ return _TTF_FontLineSkip(__traits(parameters)); }
	package _pTTF_GetFontKerning _TTF_GetFontKerning;
	extern(C) int TTF_GetFontKerning(const(TTF_Font)* font){ return _TTF_GetFontKerning(__traits(parameters)); }
	package _pTTF_SetFontKerning _TTF_SetFontKerning;
	extern(C) void TTF_SetFontKerning(TTF_Font* font, int allowed){ _TTF_SetFontKerning(__traits(parameters)); }
	package _pTTF_FontFaces _TTF_FontFaces;
	extern(C) int TTF_FontFaces(const(TTF_Font)* font){ return _TTF_FontFaces(__traits(parameters)); }
	package _pTTF_FontFaceIsFixedWidth _TTF_FontFaceIsFixedWidth;
	extern(C) int TTF_FontFaceIsFixedWidth(const(TTF_Font)* font){ return _TTF_FontFaceIsFixedWidth(__traits(parameters)); }
	package _pTTF_FontFaceFamilyName _TTF_FontFaceFamilyName;
	extern(C) char* TTF_FontFaceFamilyName(const(TTF_Font)* font){ return _TTF_FontFaceFamilyName(__traits(parameters)); }
	package _pTTF_FontFaceStyleName _TTF_FontFaceStyleName;
	extern(C) char* TTF_FontFaceStyleName(const(TTF_Font)* font){ return _TTF_FontFaceStyleName(__traits(parameters)); }
	package _pTTF_GlyphIsProvided _TTF_GlyphIsProvided;
	extern(C) int TTF_GlyphIsProvided(const(TTF_Font)* font, ushort ch){ return _TTF_GlyphIsProvided(__traits(parameters)); }
	package _pTTF_GlyphMetrics _TTF_GlyphMetrics;
	extern(C) int TTF_GlyphMetrics(TTF_Font* font, ushort ch, int* minX, int* maxX, int* minY, int* maxY, int* advance){ return _TTF_GlyphMetrics(__traits(parameters)); }
	package _pTTF_SizeText _TTF_SizeText;
	extern(C) int TTF_SizeText(TTF_Font* font, const(char)* text, int* w, int* h){ return _TTF_SizeText(__traits(parameters)); }
	package _pTTF_SizeUTF8 _TTF_SizeUTF8;
	extern(C) int TTF_SizeUTF8(TTF_Font* font, const(char)* text, int* w, int* h){ return _TTF_SizeUTF8(__traits(parameters)); }
	package _pTTF_SizeUNICODE _TTF_SizeUNICODE;
	extern(C) int TTF_SizeUNICODE(TTF_Font* font, const(ushort)* text, int* w, int* h){ return _TTF_SizeUNICODE(__traits(parameters)); }
	package _pTTF_RenderText_Solid _TTF_RenderText_Solid;
	extern(C) SDL_Surface* TTF_RenderText_Solid(TTF_Font* font, const(char)* text, SDL_Color fg){ return _TTF_RenderText_Solid(__traits(parameters)); }
	package _pTTF_RenderUTF8_Solid _TTF_RenderUTF8_Solid;
	extern(C) SDL_Surface* TTF_RenderUTF8_Solid(TTF_Font* font, const(char)* text, SDL_Color fg){ return _TTF_RenderUTF8_Solid(__traits(parameters)); }
	package _pTTF_RenderUNICODE_Solid _TTF_RenderUNICODE_Solid;
	extern(C) SDL_Surface* TTF_RenderUNICODE_Solid(TTF_Font* font, const(ushort)* text, SDL_Color fg){ return _TTF_RenderUNICODE_Solid(__traits(parameters)); }
	package _pTTF_RenderGlyph_Solid _TTF_RenderGlyph_Solid;
	extern(C) SDL_Surface* TTF_RenderGlyph_Solid(TTF_Font* font, ushort ch, SDL_Color fg){ return _TTF_RenderGlyph_Solid(__traits(parameters)); }
	package _pTTF_RenderText_Shaded _TTF_RenderText_Shaded;
	extern(C) SDL_Surface* TTF_RenderText_Shaded(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg){ return _TTF_RenderText_Shaded(__traits(parameters)); }
	package _pTTF_RenderUTF8_Shaded _TTF_RenderUTF8_Shaded;
	extern(C) SDL_Surface* TTF_RenderUTF8_Shaded(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg){ return _TTF_RenderUTF8_Shaded(__traits(parameters)); }
	package _pTTF_RenderUNICODE_Shaded _TTF_RenderUNICODE_Shaded;
	extern(C) SDL_Surface* TTF_RenderUNICODE_Shaded(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg){ return _TTF_RenderUNICODE_Shaded(__traits(parameters)); }
	package _pTTF_RenderGlyph_Shaded _TTF_RenderGlyph_Shaded;
	extern(C) SDL_Surface* TTF_RenderGlyph_Shaded(TTF_Font* font, ushort ch, SDL_Color fg,SDL_Color bg){ return _TTF_RenderGlyph_Shaded(__traits(parameters)); }
	package _pTTF_RenderText_Blended _TTF_RenderText_Blended;
	extern(C) SDL_Surface* TTF_RenderText_Blended(TTF_Font* font, const(char)* text, SDL_Color fg){ return _TTF_RenderText_Blended(__traits(parameters)); }
	package _pTTF_RenderUTF8_Blended _TTF_RenderUTF8_Blended;
	extern(C) SDL_Surface* TTF_RenderUTF8_Blended(TTF_Font* font, const(char)* text, SDL_Color fg){ return _TTF_RenderUTF8_Blended(__traits(parameters)); }
	package _pTTF_RenderUNICODE_Blended _TTF_RenderUNICODE_Blended;
	extern(C) SDL_Surface* TTF_RenderUNICODE_Blended(TTF_Font* font, const(ushort)* text, SDL_Color fg){ return _TTF_RenderUNICODE_Blended(__traits(parameters)); }
	package _pTTF_RenderText_Blended_Wrapped _TTF_RenderText_Blended_Wrapped;
	extern(C) SDL_Surface* TTF_RenderText_Blended_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength){ return _TTF_RenderText_Blended_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUTF8_Blended_Wrapped _TTF_RenderUTF8_Blended_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUTF8_Blended_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength){ return _TTF_RenderUTF8_Blended_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUNICODE_Blended_Wrapped _TTF_RenderUNICODE_Blended_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUNICODE_Blended_Wrapped(TTF_Font* font, const(ushort)* text, SDL_Color fg, uint wrapLength){ return _TTF_RenderUNICODE_Blended_Wrapped(__traits(parameters)); }
	package _pTTF_RenderGlyph_Blended _TTF_RenderGlyph_Blended;
	extern(C) SDL_Surface* TTF_RenderGlyph_Blended(TTF_Font* font, ushort ch, SDL_Color fg){ return _TTF_RenderGlyph_Blended(__traits(parameters)); }
	package _pTTF_CloseFont _TTF_CloseFont;
	extern(C) void TTF_CloseFont(TTF_Font* font){ _TTF_CloseFont(__traits(parameters)); }
	package _pTTF_Quit _TTF_Quit;
	extern(C) void TTF_Quit(){ _TTF_Quit(__traits(parameters)); }
	package _pTTF_WasInit _TTF_WasInit;
	extern(C) int TTF_WasInit(){ return _TTF_WasInit(__traits(parameters)); }
	package _pTTF_GetFontKerningSize _TTF_GetFontKerningSize;
	extern(C) int TTF_GetFontKerningSize(TTF_Font* font, int prevIndex, int index){ return _TTF_GetFontKerningSize(__traits(parameters)); }
	package _pTTF_GetFontKerningSizeGlyphs _TTF_GetFontKerningSizeGlyphs;
	extern(C) int TTF_GetFontKerningSizeGlyphs(TTF_Font* font, ushort previousCh, ushort ch){ return _TTF_GetFontKerningSizeGlyphs(__traits(parameters)); }
	package _pTTF_GetFreeTypeVersion _TTF_GetFreeTypeVersion;
	extern(C) void TTF_GetFreeTypeVersion(int* major, int* minor, int* patch){ _TTF_GetFreeTypeVersion(__traits(parameters)); }
	package _pTTF_GetHarfBuzzVersion _TTF_GetHarfBuzzVersion;
	extern(C) void TTF_GetHarfBuzzVersion(int* major, int* minor, int* patch){ _TTF_GetHarfBuzzVersion(__traits(parameters)); }
	package _pTTF_SetFontSDF _TTF_SetFontSDF;
	extern(C) int TTF_SetFontSDF(TTF_Font* font, SDL_bool on_off){ return _TTF_SetFontSDF(__traits(parameters)); }
	package _pTTF_GetFontSDF _TTF_GetFontSDF;
	extern(C) SDL_bool TTF_GetFontSDF(const(TTF_Font)* font){ return _TTF_GetFontSDF(__traits(parameters)); }
	package _pTTF_OpenFontDPI _TTF_OpenFontDPI;
	extern(C) TTF_Font* TTF_OpenFontDPI(const(char)* file, int ptSize, uint hdpi, uint vdpi){ return _TTF_OpenFontDPI(__traits(parameters)); }
	package _pTTF_OpenFontIndexDPI _TTF_OpenFontIndexDPI;
	extern(C) TTF_Font* TTF_OpenFontIndexDPI(const(char)*file, int ptSize, long index, uint hdpi, uint vdpi){ return _TTF_OpenFontIndexDPI(__traits(parameters)); }
	package _pTTF_OpenFontDPIRW _TTF_OpenFontDPIRW;
	extern(C) TTF_Font* TTF_OpenFontDPIRW(SDL_RWops* src, int freeSrc, int ptsize, uint hdpi, uint vdpi){ return _TTF_OpenFontDPIRW(__traits(parameters)); }
	package _pTTF_OpenFontIndexDPIRW _TTF_OpenFontIndexDPIRW;
	extern(C) TTF_Font* TTF_OpenFontIndexDPIRW(SDL_RWops* src, int freeSrc, int ptSize, long index, uint hdpi, uint vdpi){ return _TTF_OpenFontIndexDPIRW(__traits(parameters)); }
	package _pTTF_SetFontSizeDPI _TTF_SetFontSizeDPI;
	extern(C) int TTF_SetFontSizeDPI(TTF_Font* font, int ptsize, uint hdpi, uint vdpi){ return _TTF_SetFontSizeDPI(__traits(parameters)); }
	package _pTTF_GlyphIsProvided32 _TTF_GlyphIsProvided32;
	extern(C) int TTF_GlyphIsProvided32(TTF_Font* font, uint ch){ return _TTF_GlyphIsProvided32(__traits(parameters)); }
	package _pTTF_GlyphMetrics32 _TTF_GlyphMetrics32;
	extern(C) int TTF_GlyphMetrics32(TTF_Font* font, uint ch, int* minx, int* maxx, int* miny, int* maxy, int* advance){ return _TTF_GlyphMetrics32(__traits(parameters)); }
	package _pTTF_RenderGlyph32_Solid _TTF_RenderGlyph32_Solid;
	extern(C) SDL_Surface* TTF_RenderGlyph32_Solid(TTF_Font* font, uint ch, SDL_Color fg){ return _TTF_RenderGlyph32_Solid(__traits(parameters)); }
	package _pTTF_RenderGlyph32_Shaded _TTF_RenderGlyph32_Shaded;
	extern(C) SDL_Surface* TTF_RenderGlyph32_Shaded(TTF_Font* font, uint ch, SDL_Color fg, SDL_Color bg){ return _TTF_RenderGlyph32_Shaded(__traits(parameters)); }
	package _pTTF_RenderGlyph32_Blended _TTF_RenderGlyph32_Blended;
	extern(C) SDL_Surface* TTF_RenderGlyph32_Blended(TTF_Font* font, uint ch, SDL_Color fg){ return _TTF_RenderGlyph32_Blended(__traits(parameters)); }
	package _pTTF_GetFontKerningSizeGlyphs32 _TTF_GetFontKerningSizeGlyphs32;
	extern(C) int TTF_GetFontKerningSizeGlyphs32(TTF_Font* font, uint previousCh, uint ch){ return _TTF_GetFontKerningSizeGlyphs32(__traits(parameters)); }
	package _pTTF_SetDirection _TTF_SetDirection;
	extern(C) int TTF_SetDirection(int direction){ return _TTF_SetDirection(__traits(parameters)); }
	package _pTTF_SetScript _TTF_SetScript;
	extern(C) int TTF_SetScript(int script){ return _TTF_SetScript(__traits(parameters)); }
	package _pTTF_MeasureText _TTF_MeasureText;
	extern(C) int TTF_MeasureText(TTF_Font* font, const(char)* text, int measureWidth, int* extent, int* count){ return _TTF_MeasureText(__traits(parameters)); }
	package _pTTF_MeasureUTF8 _TTF_MeasureUTF8;
	extern(C) int TTF_MeasureUTF8(TTF_Font* font, const(char)* text, int measureWidth, int* extent, int* count){ return _TTF_MeasureUTF8(__traits(parameters)); }
	package _pTTF_MeasureUNICODE _TTF_MeasureUNICODE;
	extern(C) int TTF_MeasureUNICODE(TTF_Font* font, const(ushort)* text, int measureWidth, int* extent, int* count){ return _TTF_MeasureUNICODE(__traits(parameters)); }
	package _pTTF_SetFontSize _TTF_SetFontSize;
	extern(C) int TTF_SetFontSize(TTF_Font* font, int ptsize){ return _TTF_SetFontSize(__traits(parameters)); }
	package _pTTF_RenderText_Solid_Wrapped _TTF_RenderText_Solid_Wrapped;
	extern(C) SDL_Surface* TTF_RenderText_Solid_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength){ return _TTF_RenderText_Solid_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUTF8_Solid_Wrapped _TTF_RenderUTF8_Solid_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUTF8_Solid_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, uint wrapLength){ return _TTF_RenderUTF8_Solid_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUNICODE_Solid_Wrapped _TTF_RenderUNICODE_Solid_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUNICODE_Solid_Wrapped(TTF_Font* font, const(ushort)* text, SDL_Color fg, uint wrapLength){ return _TTF_RenderUNICODE_Solid_Wrapped(__traits(parameters)); }
	package _pTTF_RenderText_Shaded_Wrapped _TTF_RenderText_Shaded_Wrapped;
	extern(C) SDL_Surface* TTF_RenderText_Shaded_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength){ return _TTF_RenderText_Shaded_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUTF8_Shaded_Wrapped _TTF_RenderUTF8_Shaded_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUTF8_Shaded_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength){ return _TTF_RenderUTF8_Shaded_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUNICODE_Shaded_Wrapped _TTF_RenderUNICODE_Shaded_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUNICODE_Shaded_Wrapped(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg, uint wrapLength){ return _TTF_RenderUNICODE_Shaded_Wrapped(__traits(parameters)); }
	package _pTTF_GetFontWrappedAlign _TTF_GetFontWrappedAlign;
	extern(C) int TTF_GetFontWrappedAlign(const(TTF_Font)* font){ return _TTF_GetFontWrappedAlign(__traits(parameters)); }
	package _pTTF_SetFontWrappedAlign _TTF_SetFontWrappedAlign;
	extern(C) void TTF_SetFontWrappedAlign(TTF_Font* font, int align_){ _TTF_SetFontWrappedAlign(__traits(parameters)); }
	package _pTTF_RenderText_LCD _TTF_RenderText_LCD;
	extern(C) SDL_Surface* TTF_RenderText_LCD(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg){ return _TTF_RenderText_LCD(__traits(parameters)); }
	package _pTTF_RenderUTF8_LCD _TTF_RenderUTF8_LCD;
	extern(C) SDL_Surface* TTF_RenderUTF8_LCD(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg){ return _TTF_RenderUTF8_LCD(__traits(parameters)); }
	package _pTTF_RenderUNICODE_LCD _TTF_RenderUNICODE_LCD;
	extern(C) SDL_Surface* TTF_RenderUNICODE_LCD(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg){ return _TTF_RenderUNICODE_LCD(__traits(parameters)); }
	package _pTTF_RenderText_LCD_Wrapped _TTF_RenderText_LCD_Wrapped;
	extern(C) SDL_Surface* TTF_RenderText_LCD_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength){ return _TTF_RenderText_LCD_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUTF8_LCD_Wrapped _TTF_RenderUTF8_LCD_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUTF8_LCD_Wrapped(TTF_Font* font, const(char)* text, SDL_Color fg, SDL_Color bg, uint wrapLength){ return _TTF_RenderUTF8_LCD_Wrapped(__traits(parameters)); }
	package _pTTF_RenderUNICODE_LCD_Wrapped _TTF_RenderUNICODE_LCD_Wrapped;
	extern(C) SDL_Surface* TTF_RenderUNICODE_LCD_Wrapped(TTF_Font* font, const(ushort)* text, SDL_Color fg, SDL_Color bg, uint wrapLength){ return _TTF_RenderUNICODE_LCD_Wrapped(__traits(parameters)); }
	package _pTTF_RenderGlyph_LCD _TTF_RenderGlyph_LCD;
	extern(C) SDL_Surface* TTF_RenderGlyph_LCD(TTF_Font* font, ushort ch, SDL_Color fg, SDL_Color bg){ return _TTF_RenderGlyph_LCD(__traits(parameters)); }
	package _pTTF_RenderGlyph32_LCD _TTF_RenderGlyph32_LCD;
	extern(C) SDL_Surface* TTF_RenderGlyph32_LCD(TTF_Font* font, uint ch, SDL_Color fg, SDL_Color bg){ return _TTF_RenderGlyph32_LCD(__traits(parameters)); }
	package _pTTF_SetFontDirection _TTF_SetFontDirection;
	extern(C) int TTF_SetFontDirection(TTF_Font* font, TTF_Direction direction){ return _TTF_SetFontDirection(__traits(parameters)); }
	package _pTTF_SetFontScriptName _TTF_SetFontScriptName;
	extern(C) int TTF_SetFontScriptName(TTF_Font* font, const(char)* script){ return _TTF_SetFontScriptName(__traits(parameters)); }
}

import bindbc.loader: SharedLib, bindSymbol;
static void bindModuleSymbols(SharedLib lib) nothrow @nogc{
	alias here = mixin((string mod=__MODULE__){
	static if(__traits(compiles, typeof(this))) return __traits(identifier, typeof(this));
	else return mod;
}());
	lib.bindSymbol(cast(void**)&_TTF_Linked_Version, here.TTF_Linked_Version.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_ByteSwappedUNICODE, here.TTF_ByteSwappedUNICODE.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_Init, here.TTF_Init.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFont, here.TTF_OpenFont.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFontIndex, here.TTF_OpenFontIndex.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFontRW, here.TTF_OpenFontRW.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFontIndexRW, here.TTF_OpenFontIndexRW.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontStyle, here.TTF_GetFontStyle.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontStyle, here.TTF_SetFontStyle.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontOutline, here.TTF_GetFontOutline.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontOutline, here.TTF_SetFontOutline.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontHinting, here.TTF_GetFontHinting.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontHinting, here.TTF_SetFontHinting.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontHeight, here.TTF_FontHeight.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontAscent, here.TTF_FontAscent.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontDescent, here.TTF_FontDescent.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontLineSkip, here.TTF_FontLineSkip.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontKerning, here.TTF_GetFontKerning.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontKerning, here.TTF_SetFontKerning.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontFaces, here.TTF_FontFaces.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontFaceIsFixedWidth, here.TTF_FontFaceIsFixedWidth.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontFaceFamilyName, here.TTF_FontFaceFamilyName.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_FontFaceStyleName, here.TTF_FontFaceStyleName.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GlyphIsProvided, here.TTF_GlyphIsProvided.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GlyphMetrics, here.TTF_GlyphMetrics.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SizeText, here.TTF_SizeText.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SizeUTF8, here.TTF_SizeUTF8.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SizeUNICODE, here.TTF_SizeUNICODE.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_Solid, here.TTF_RenderText_Solid.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_Solid, here.TTF_RenderUTF8_Solid.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_Solid, here.TTF_RenderUNICODE_Solid.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph_Solid, here.TTF_RenderGlyph_Solid.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_Shaded, here.TTF_RenderText_Shaded.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_Shaded, here.TTF_RenderUTF8_Shaded.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_Shaded, here.TTF_RenderUNICODE_Shaded.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph_Shaded, here.TTF_RenderGlyph_Shaded.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_Blended, here.TTF_RenderText_Blended.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_Blended, here.TTF_RenderUTF8_Blended.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_Blended, here.TTF_RenderUNICODE_Blended.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_Blended_Wrapped, here.TTF_RenderText_Blended_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_Blended_Wrapped, here.TTF_RenderUTF8_Blended_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_Blended_Wrapped, here.TTF_RenderUNICODE_Blended_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph_Blended, here.TTF_RenderGlyph_Blended.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_CloseFont, here.TTF_CloseFont.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_Quit, here.TTF_Quit.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_WasInit, here.TTF_WasInit.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontKerningSize, here.TTF_GetFontKerningSize.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontKerningSizeGlyphs, here.TTF_GetFontKerningSizeGlyphs.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFreeTypeVersion, here.TTF_GetFreeTypeVersion.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetHarfBuzzVersion, here.TTF_GetHarfBuzzVersion.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontSDF, here.TTF_SetFontSDF.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontSDF, here.TTF_GetFontSDF.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFontDPI, here.TTF_OpenFontDPI.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFontIndexDPI, here.TTF_OpenFontIndexDPI.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFontDPIRW, here.TTF_OpenFontDPIRW.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_OpenFontIndexDPIRW, here.TTF_OpenFontIndexDPIRW.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontSizeDPI, here.TTF_SetFontSizeDPI.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GlyphIsProvided32, here.TTF_GlyphIsProvided32.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GlyphMetrics32, here.TTF_GlyphMetrics32.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph32_Solid, here.TTF_RenderGlyph32_Solid.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph32_Shaded, here.TTF_RenderGlyph32_Shaded.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph32_Blended, here.TTF_RenderGlyph32_Blended.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontKerningSizeGlyphs32, here.TTF_GetFontKerningSizeGlyphs32.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetDirection, here.TTF_SetDirection.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetScript, here.TTF_SetScript.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_MeasureText, here.TTF_MeasureText.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_MeasureUTF8, here.TTF_MeasureUTF8.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_MeasureUNICODE, here.TTF_MeasureUNICODE.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontSize, here.TTF_SetFontSize.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_Solid_Wrapped, here.TTF_RenderText_Solid_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_Solid_Wrapped, here.TTF_RenderUTF8_Solid_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_Solid_Wrapped, here.TTF_RenderUNICODE_Solid_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_Shaded_Wrapped, here.TTF_RenderText_Shaded_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_Shaded_Wrapped, here.TTF_RenderUTF8_Shaded_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_Shaded_Wrapped, here.TTF_RenderUNICODE_Shaded_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_GetFontWrappedAlign, here.TTF_GetFontWrappedAlign.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontWrappedAlign, here.TTF_SetFontWrappedAlign.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_LCD, here.TTF_RenderText_LCD.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_LCD, here.TTF_RenderUTF8_LCD.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_LCD, here.TTF_RenderUNICODE_LCD.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderText_LCD_Wrapped, here.TTF_RenderText_LCD_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUTF8_LCD_Wrapped, here.TTF_RenderUTF8_LCD_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderUNICODE_LCD_Wrapped, here.TTF_RenderUNICODE_LCD_Wrapped.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph_LCD, here.TTF_RenderGlyph_LCD.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_RenderGlyph32_LCD, here.TTF_RenderGlyph32_LCD.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontDirection, here.TTF_SetFontDirection.mangleof);
	lib.bindSymbol(cast(void**)&_TTF_SetFontScriptName, here.TTF_SetFontScriptName.mangleof);
}

// expansion at deps/bindbc-sdl/source/sdl_ttf.d(252,1)

void unloadSDLTTF(){ if(lib != invalidHandle) lib.unload(); }

bool isSDLTTFLoaded(){ return lib != invalidHandle; }

SDLTTFSupport loadSDLTTF(){
	const(char)[][libNamesCT.length] libNames = libNamesCT;
	
	SDLTTFSupport ret;
	foreach(name; libNames){
		ret = loadSDLTTF(name.ptr);
		//TODO: keep trying until we get the version we want, otherwise default to the highest one?
		if(ret != SDLTTFSupport.noLibrary && ret != SDLTTFSupport.badLibrary) break;
	}
	return ret;
}

SDLTTFSupport loadSDLTTF(const(char)* libName){
	lib = bindbc.loader.load(libName);
	if(lib == invalidHandle){
		return SDLTTFSupport.noLibrary;
	}
	
	auto errCount = errorCount();
	loadedVersion = SDLTTFSupport.badLibrary;

	sdl_ttf.bindModuleSymbols(lib);
	
	if(errCount == errorCount()) loadedVersion = sdlTTFSupport; //this is a white-lie in order to maintain backwards-compatibility :(
	return loadedVersion;
}

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(449,16)
cast(T)a < cast(T) b

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/internal/memory.d(32,18)
onOutOfMemoryError();

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(445,13)
enum int data = 0;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(445,13)
enum int count = 0;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(624,9)
alias _0LU = Identity!(field[0LU]);alias data = _0LU;alias _1LU = Identity!(field[1LU]);alias count = _1LU;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(624,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7004,17)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7021,21)

    case '\u0000':..case '\u0008':case '\u000E':..case '\u001F':case '\u007F':..
    case '\u0084':case '\u0086':..case '\u009F': case '\u0009':..case '\u000C': case '\u0085':

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7030,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7034,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7040,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7044,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7049,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7056,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7060,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7068,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7082,13)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7004,17)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7021,21)

    case '\u0000':..case '\u0008':case '\u000E':..case '\u001F':case '\u007F':..
    case '\u0084':case '\u0086':..case '\u009F': case '\u0009':..case '\u000C': case '\u0085':

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7030,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7034,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7040,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7044,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7049,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7056,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7060,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7068,21)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/uni/package.d(7082,13)

            static if (getValue)
                grapheme ~= ch;
            range.popFront();
        

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs < rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs < rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs == rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs < rhs

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/typecons.d(517,31)
lhs < rhs

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(219,13)
alias a = __a ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(220,13)
alias b = __b ;

// expansion at /usr/lib/ldc/x86_64-linux-gnu/include/d/std/functional.d(221,20)
a == b

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at 
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

