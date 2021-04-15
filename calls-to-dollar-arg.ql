import javascript

from CallExpr dollarCall, Expr expr
where
    dollarCall.getCalleeName() = "$" and
    dollarCall.getArgument(0) = expr
select expr