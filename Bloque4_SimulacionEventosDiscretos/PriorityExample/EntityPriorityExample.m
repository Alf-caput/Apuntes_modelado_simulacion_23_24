%% Using Entity Priority to Sequence Departures

% Copyright 2016 The MathWorks, Inc.
 
%% Description
% This example shows how to use entity priority to sequence entity
% departures when multiple entities are available to depart. The example
% models an airport check-in counter where passengers arrive to be
% checked in. Passengers can have either First-Class, Business Class, or
% Economy Class reservations, modeled using entity priority
% values 1, 2 and 3 respectively.
%
% The example models two scenarios:
%%
% * The first involves a Priority Queue in which passengers are explicitly
% sorted by their entity priority. This ensures that all First Class
% passengers are sorted before Business Class, which are in turn sorted
% before Economy Class. This is called "Explicit Prioritization" in the
% model.
% * The second involves an Entity Server in which all passengers are
% waiting in an unordered fashion. When the check-in agent is available,
% all passengers schedule departure events. These simultaneous events are
% ordered by entity priority, ensuring that the entity with the highest
% priority will depart first, and all the other departures will fail. This
% is called "Implicit Prioritization" in the model.

modelname = 'seEntityPriority';
open_system(modelname);
sim(modelname);

%% Results
% In this simulation, the Entity Generator simultaneously generates 30
% passengers at time 0. Once 30 are available in the Pool, the Entity
% Gate opens and all passengers can depart. The results show the
% simultaneous arrivals of all passengers at time 0 with their entity
% priorities. When the Gate opens, it is seen that all passengers depart in
% order of their entity priority.

%%
bdclose all;
clear modelname
