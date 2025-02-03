module widget;

import bindbc.sdl;
import doc;
import etree;
import e;
import klass;

alias WIDGET_SET_FN         = void function (Doc* doc, ETree* t, Klass* kls, string field, string[] values);
alias WIDGET_EVENT_FN       = void function (Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer);
alias WIDGET_DRAW_FN        = void function (SDL_Renderer* renderer, E* e);
alias WIDGET_APPLY_KLASS_FN = void function (Doc* doc, ETree* t, Klass* klass);
