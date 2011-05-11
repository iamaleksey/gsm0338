%%% Copyright (c) 2010 Aleksey Yeschenko <aleksey@yeschenko.com>
%%%
%%% Permission is hereby granted, free of charge, to any person obtaining a copy
%%% of this software and associated documentation files (the "Software"), to deal
%%% in the Software without restriction, including without limitation the rights
%%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%%% copies of the Software, and to permit persons to whom the Software is
%%% furnished to do so, subject to the following conditions:
%%%
%%% The above copyright notice and this permission notice shall be included in
%%% all copies or substantial portions of the Software.
%%%
%%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%%% THE SOFTWARE.

-module(gsm0338).

-on_load(load_nif/0).

-export([from_utf8/1, to_utf8/1]).

-spec from_utf8(binary()) -> {'valid', binary()} | {'invalid', binary()}.
from_utf8(_Bin) ->
    erlang:nif_error(not_loaded).

-spec to_utf8(binary()) -> {'valid', binary()} | {'invalid', binary()}.
to_utf8(_Bin) ->
    erlang:nif_error(not_loaded).

%% -------------------------------------------------------------------------
%% on_load callback
%% -------------------------------------------------------------------------

load_nif() ->
    erlang:load_nif(filename:join(code:priv_dir(gsm0338), "gsm0338"), 0).
