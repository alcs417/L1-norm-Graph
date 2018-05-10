
### W is the similarity matrix ; Y is the label matrix ###

LP_norm1 <- function(W, Y, con_condition, n){
	D <- diag(apply(W, 1, sum))

	U <- diag(1, nrow(W), ncol(W))
	if(!missing(n)){
		if(length(n) == 1) { 
			diag(U)[Y[, n, drop=T]==1] <- 1000000
		} else {
			diag(U)[apply(Y[, n]==1, 1, sum) >= 1] <- 1000000
		}		
	}

	L <- D - W
	Q <- solve(L + U, U %*% Y)
	
	distQ <- sqrt(abs(L2_distance(Q, Q)) + .Machine$double.eps)

	last_obj <- Inf
	cur_obj <- 0.5 * sum(distQ * W) + sum(diag(t(Q - Y) %*% U %*% (Q - Y)))
#	print(cur_obj)
	
	i <- 1
#	while(i <= 20){
	while(last_obj - cur_obj > con_condition){
		W1 <- W / (2 * distQ)
		D1 <- diag(apply(W1, 1, sum))
		L1 <- D1 - W1
		Q <- solve(L1 + U, U %*% Y)
		
		distQ <- sqrt(abs(L2_distance(Q, Q)) + .Machine$double.eps)
		last_obj <- cur_obj
		cur_obj <- 0.5 * sum(distQ * W) + sum(diag(t(Q - Y) %*% U %*% (Q - Y)))

#		print(cur_obj)
#		i <- i + 1
	}

	list(Q=Q, W1=W1)
}

### A and B are matrices ###
L2_distance <- function(A, B){
	rowA <- apply(A*A, 1, sum)
	matrixA <- matrix(rep(rowA, each=length(rowA)), nrow=length(rowA), byrow=T)
	rowB <- apply(B*B, 1, sum)
	matrixB <- matrix(rep(rowB, each=length(rowB)), nrow=length(rowB), byrow=F)
	C <- 2 * A %*% t(B)
	dis <- Re(matrixA + matrixB - C)
}

