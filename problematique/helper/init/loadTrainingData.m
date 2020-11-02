function [nP300, P300, Inconnus] = loadTrainingData()

P300 = load("ref_P300");
nP300 = load("ref_NP300");

Inconnus = load("Inconnus");

end

