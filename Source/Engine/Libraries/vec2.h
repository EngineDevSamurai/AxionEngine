#ifndef VEC2_H
#define VEC2_H

#include <stdint.h>
#include <stdbool.h>

// --------------------------------------------
// Fixed-point type: Q12.4 (12 integer bits, 4 fractional bits)
// --------------------------------------------
typedef int16_t f12;

// Conversion macros
#define F12(x)       ((f12)((x) << 4))  // int -> f12
#define TO_INT(x)    ((x) >> 4)         // f12 -> int

// --------------------------------------------
// 2D vector using f12 fixed-point
// --------------------------------------------
typedef struct {
    f12 x;
    f12 y;
} vec2;

// Constructor macro for easy initialization
#define VEC2(x, y) ((vec2){ F12(x), F12(y) })

// --------------------------------------------
// Vector operations
// --------------------------------------------

// Set Values
static inline void vec2_set(vec2 *v, int x, int y) {
    v->x = F12(x);
    v->y = F12(y);
}

// Add vector b to a
static inline void vec2_add(vec2 *a, const vec2 *b) {
    a->x += b->x;
    a->y += b->y;
}

// Subtract vector b from a
static inline void vec2_sub(vec2 *a, const vec2 *b) {
    a->x -= b->x;
    a->y -= b->y;
}

// Scale vector a by scalar s
static inline void vec2_scale(vec2 *a, f12 s) {
    // Multiply each component by scalar, result remains f12
    a->x = ((int32_t)a->x * s) >> 4;
    a->y = ((int32_t)a->y * s) >> 4;
}

// Copy vector src into dest
static inline void vec2_copy(vec2 *dest, const vec2 *src) {
    dest->x = src->x;
    dest->y = src->y;
}

// Compare two vectors for equality
static inline bool vec2_equal(const vec2 *a, const vec2 *b) {
    return a->x == b->x && a->y == b->y;
}

// --------------------------------------------
// 2D vector using int8_t type
// --------------------------------------------
typedef struct {
    int8_t x;
    int8_t y;
} vec2_i;

#endif
