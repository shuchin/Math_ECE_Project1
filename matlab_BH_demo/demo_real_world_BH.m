 function [adj,sigma,inferred_sigma,overlap] = demo_real_world_BH(name)
 	% Spectral clustering using various methods on real world graphs in GML format
 	% INPUTS :
 	% name is a string containing the name of the network to load, e.g. 'dolphins.gml'.
    % The networks should be in .gml format and placed in the real_world_networks folder.
    % OUTPUTS :
    % adj is the adjacency matrix of the graph
    % sigma is the true community assignement of the nodes 
    % inferred_sigma is the community assignement inferred by the spectral clustering method 
    % overlap is the overlap (as defined in the paper) between the inferred community assignement and the real one 
   

    path(path,'./subroutines/');
    path(path,'./real_world_networks/');

    if(nargin~=1)
      usage_real_world_BH;
      error('type help demo_real_world_BH for a description');
  end

  

  [E,sigma]=read_gml(name);

  N=max(max(E));
  q=max(sigma);
  nnz=2*length(E)+N;
  si=nnz-N;
  i0=E(:,1);
  j0=E(:,2);
  i=[i0;j0];
  j=[j0;i0];

  adj=sparse(i,j,ones(2*length(E),1),N,N);


  warning('off','MATLAB:eigs:NoEigsConverged');
  warning('off','MATLAB:eigs:NotAllEigsConverged');
  warning('off','stats:kmeans:FailedToConvergeRep');
  warning('off','stats:kmeans:EmptyClusterInBatchUpdate');

  [inferred_sigma,overlap]=BH_cluster_real_world(adj,sigma,q);
  
    % [inferred_sigmaLap,overlapLap]=Lap_cluster_real_world(adj,sigma,q);



end
