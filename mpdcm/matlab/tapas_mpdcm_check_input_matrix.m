function tapas_mpdcm_check_input_matrix(theta, ns, field, element)
%% Check the correctnes of a matrix or reports an error. 
%
% Input
%   theta       -- Cell array
%   ns          -- Expected size of the matrix
%   field       -- String with the respetive field
%   element     -- Index
%
% Output
%
% aponteeduardo@gmail.com
% copyright (C) 2015
%

assert(isfield(theta{element}, field), ...
    sprintf('mpdcm:int:input:theta:cell:%s:missing', field), ...
    'Element theta{%d} doesn''t have field %s', element, field);
m = getfield(theta{element}, field);
assert(isnumeric(m), ...
    sprintf('mpdcm:int:input:theta:cell:%s:not_numeric', field), ...
    'theta{%d}.%s should be numeric', element, field);
assert(isreal(m), ...
    sprintf('mpdcm:int:input:theta:cell:%s:not_real', field), ...
    'theta{%d}.%s should be real', element, field);
assert(~issparse(m), ...
    sprintf('mpdcm:int:input:theta:cell:%s:sparse', field), ...
    'theta{%d}.%s should not be sparse', element, field);
assert(ndims(m) == numel(ns), ...
    sprintf('mpdcm:int:input:theta:cell:%s:ndim', field), ...
    'theta{%d}.%s should have %d dimensions', ...
    element, field, numel(ns))
assert(all(size(m) == ns), ...
    sprintf('mpdcm:int:input:theta:cell:%s:dsize', field), ...
    'theta{%d}.%s should have dimensions [%d,%d], instead [%d,%d].', ...
    element, field, ns(1), ns(2), size(m, 1), size(m, 2));

end
