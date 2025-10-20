#ifndef EVENT_MANIFEST_H
#define EVENT_MANIFEST_H

// Engine-wide event type identifiers
typedef enum {
    EVENT_ZERO = 0, // Reserved
    ON_LOAD,
    ON_EXIT,
    ON_COLLISION,
    ON_CREATE_ENTITY,
    ON_DESTROY_ENTITY
} EventType;

#endif