package msr;

   sub new{
     $class = shift;
     $ref   = {};
     bless($ref, $class);
     return $ref;
   } 
   
   sub fun1{
     $class = shift;
     $var   = shift;
     return $var;
   } 
1;
    



__END__
package test;

  sub new{
    $class = shift;
    $ref   = {};
    bless($ref, $class);
    return $ref;
  }

  sub m1{
    $class_n = shift;
    $var     = shift;
    return $var;	
  }
  
1;