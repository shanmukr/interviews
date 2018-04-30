package msr;
 
  sub new{
    $class = shift;
    $ref = {};
    bless($ref, $class);
    return $ref;
  }
  sub fun1{
    $class = shift;
    $b = shift;
    return $b;
  } 

1;