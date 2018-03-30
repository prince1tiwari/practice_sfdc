public with sharing class Derived {

public Integer age {get; set;}

Base objbase;

public Derived(Base base1) { 

age = 15;

this.objbase = base1;

}

//No meening of overloading constructor.

public Derived() {

}

public PageReference callDerived() {

age = age + 10;

objbase.phone = 2222222; 

return null;

  }

}