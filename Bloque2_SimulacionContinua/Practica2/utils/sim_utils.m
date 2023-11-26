function [cfg, model_names, constants] = sim_utils()
    % MODELS
    model_names = {'Ejer1_EcVanDerPol', 'Modelo_Amortiguacion', };
    constants = {struct(x0=0.25, dx0=1), struct(Cc=30, mc=60, mr=12, Kc=20, Kr=700, Tp=randi([1, 5], 1), Tf=randi([3, 6], 1)), };

    % SOLVER CONFIGS
    SolverTypes = {'Variable-Step', };
    SolverNames = {'ode45', };
    StartTimes = {0, };
    FixedSteps = {1, };
    StopTimes = {10, };

    solver_fields = {'SolverType', 'SolverName', 'StartTime', 'FixedStep', 'StopTime', };
    solver_compress_fields = {SolverTypes, SolverNames, StartTimes, FixedSteps, StopTimes, };
    solver_compress_fields = cellfun(@string, solver_compress_fields, UniformOutput=false);

    % PLOT CONFIGS
    Xs = {};
    Ys = {};
    Colors = {'', };
    LineStyles = {'-', };
    LineWidths = {'', };
    DisplayNames = {'', };

    pl_fields = {'', '', 'LineStyle', 'LineWidth', 'DisplayName', 'Color', };
    pl_compress_fields = {Xs, Ys, LineStyles, LineWidths, DisplayNames, Colors, };

    % SCATTER CONFIGS
    Xs = {};
    Ys = {};
    Markers = {'.', };
    SizesData = {'32', };
    MarkersFaceColor = {'flat', };
    MarkersEdgeColor = {'flat', };
    MarkersFaceAlpha = {0.5, };
    MarkersEdgeAlpha = {0.5, };
    DisplayNames = {'', };

    sc_fields = {'', '', 'Marker', 'SizeData', 'MarkerFaceColor', 'MarkerEdgeColor', 'MarkerFaceAlpha', 'MarkerEdgeAlpha', 'DisplayName', };
    sc_compress_fields = {Xs, Ys, Markers, SizesData, MarkersFaceColor, MarkersEdgeColor, MarkersEdgeAlpha, MarkersFaceAlpha, DisplayNames, };
    sc_compress_fields = cellfun(@string, sc_compress_fields, UniformOutput=false);

    % XLABEL CONFIGS
    txts = {'', };
    Interpreters = {'latex', };

    xlabel_fields = {'', 'Interpreter', };
    xlabel_compress_fields = {txts, Interpreters, };

    % YLABEL CONFIGSS
    txts = {'', };
    Interpreters = {'latex', };


    ylabel_fields = {'', 'Interpreter', };
    ylabel_compress_fields = {txts, Interpreters, };

    % TITLE CONFIGS
    txts = {'', };
    Interpreters = {'latex', };

    titlelabel_fields = {'', 'Interpreter', };
    titlelabel_compress_fields = {txts, Interpreters, };

    % LEGEND CONFIG
    labels = {'show', };
    Locations = {'northeast', };
    
    legend_fields = {'', 'Location', };
    legend_compress_fields = {labels, Locations, };
    
    % GROUP CONFIG PARAMETERS INTO SINGLE CONFIGS
    solver_configs = group_data(solver_fields, solver_compress_fields);
    pl_configs = group_data(pl_fields, pl_compress_fields);
    sc_configs = group_data(sc_fields, sc_compress_fields);
    xlabel_configs = group_data(xlabel_fields, xlabel_compress_fields);
    ylabel_configs = group_data(ylabel_fields, ylabel_compress_fields);
    titlelabel_configs = group_data(titlelabel_fields, titlelabel_compress_fields);
    legend_configs = group_data(legend_fields, legend_compress_fields);

    % COMPRESS CONFIGS
    compress_configs = {solver_configs, pl_configs, sc_configs, xlabel_configs, ylabel_configs, titlelabel_configs, legend_configs, };
    config_types = {'solver', 'plot', 'scatter', 'xlabel', 'ylabel', 'title', 'legend', };

    cfg = group_configs(config_types, compress_configs);


    function cfg = group_configs(config_types, compress_configs)
    % Join configs into a base config (cfg)
    % Example: cfg.plot{3}{:} returns all args for plot config in index 3 of plot configs
    % INPUTS
    % ------------------------------------------
    % config_types = cell array
    % configs = cell array of cell arrays
    %
    % OUTPUTS
    % ------------------------------------------
    % cfg = struct of cell arrays
        cfg = struct();
        for i=1:length(config_types)
            cfg.(config_types{i}) = compress_configs{i};
        end
    end


    function grouped_data = group_data(field_names, compress_fields)
    % Group named args
    % INPUTS
    % ------------------------------------------
    % field_names = cell array
    % compress_fields = cell array of cell arrays
    %
    % OUTPUTS
    % ------------------------------------------
    % grouped_data = cell array of cell arrays
        n = max(cellfun(@length, compress_fields));
        m = length(field_names);
        grouped_data = cell(1, n);
        for i = 1:n
            group_i = cell(1, m);
            for j = 1:m
                try
                    value = compress_fields{j}{i};
                    field = field_names(j);
                
                    if isempty(value)
                        continue
                    end
                    if isempty(field{1})
                        group_i{j} = value;
                    else
                        group_i{j} = [field, value];
                    end
                catch
                    continue
                end
            end
            grouped_data{i} = horzcat(group_i{:});
        end
    end
end
