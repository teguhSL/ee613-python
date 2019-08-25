function prob = gaussPDF(Data, Mu, Sigma)
% Likelihood of datapoint(s) to be generated by a Gaussian parameterized by center and covariance.
% Inputs -----------------------------------------------------------------
%   o Data:  D x N array representing N datapoints of D dimensions.
%   o Mu:    D x 1 vector representing the center of the Gaussian.
%   o Sigma: D x D array representing the covariance matrix of the Gaussian.
% Output -----------------------------------------------------------------
%   o prob:  1 x N vector representing the likelihood of the N datapoints.
%
% Writing code takes time. Polishing it and making it available to others takes longer! 
% If some parts of the code were useful for your research of for a better understanding 
% of the algorithms, please reward the authors by citing the related publications, 
% and consider making your own research available in this way.
%
% @article{Calinon16JIST,
%   author="Calinon, S.",
%   title="A Tutorial on Task-Parameterized Movement Learning and Retrieval",
%   journal="Intelligent Service Robotics",
%   publisher="Springer Berlin Heidelberg",
%   doi="10.1007/s11370-015-0187-9",
%   year="2016",
%   volume="9",
%   number="1",
%   pages="1--29"
% }
%
% Copyright (c) 2015 Idiap Research Institute, http://idiap.ch/
% Written by Sylvain Calinon, http://calinon.ch/
% 
% This file is part of PbDlib, http://www.idiap.ch/software/pbdlib/
% 
% PbDlib is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License version 3 as
% published by the Free Software Foundation.
% 
% PbDlib is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with PbDlib. If not, see <http://www.gnu.org/licenses/>.


[nbVar,nbData] = size(Data);
Data = Data' - repmat(Mu',nbData,1);
prob = sum((Data * inv(Sigma)).*Data, 2);
prob = exp(-0.5*prob) / sqrt((2*pi)^nbVar * abs(det(Sigma)) + realmin);
