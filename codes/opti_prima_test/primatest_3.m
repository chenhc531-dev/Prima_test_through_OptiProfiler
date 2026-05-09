set(groot, ...
    'defaultFigureRenderer','painters', ...
    'defaultFigureVisible','off', ...
    'defaultFigureCreateFcn','');

options.ptype = 'ubln';
options.mindim = 2;
options.maxdim = 10;

options.feature_name='plain';
scores_plain=benchmark({@prima_double, @prima_quadruple}, options);

exit;
