#include <iostream>
#include <sstream>
#include <string>

#include <alice/event.hpp>

class DataEventArgs
{
public:
  DataEventArgs( const std::string &d ) : _Data( d ) { }
  std::string Data() const { return _Data; }

private:
  std::string _Data;
};

class PointlessEventArgs
{

};

class MySubject
{
public:
  Alice::Event<DataEventArgs*> OnData;
  Alice::Event<PointlessEventArgs*> Pointless;
  Alice::Event<int> IntegerEvent;

  void Run()
  {
    DataEventArgs eda( "This is the data from MySubject" );
    OnData( &eda );

    PointlessEventArgs epa;
    Pointless( &epa );

    IntegerEvent( 23 );
  }
};

class MyObserver
{
public:
  MyObserver( MySubject *subject )
    : _Subject( subject )
  {
    subject->OnData.Add( this, &MyObserver::DataHandler );
    subject->Pointless.Add( this, &MyObserver::PointlessHandler );
    subject->Pointless.Add( this, &MyObserver::FooHandler );
    subject->IntegerEvent.Add( this, &MyObserver::IntegerHandler );
  }

private:
  void DataHandler( DataEventArgs *args )
  {
    std::cout << "MyObserver::" << __FUNCTION__ << ": args->Data() == "
	      << args->Data() << std::endl;
  }

  void PointlessHandler( PointlessEventArgs *args )
  {
    std::cout << "MyObserver::" << __FUNCTION__ << std::endl;
  }

  void FooHandler( PointlessEventArgs *args )
  {
    std::cout << "MyObserver::" << __FUNCTION__ << std::endl;
    _Subject->Pointless.Remove( this, &MyObserver::FooHandler );
  }

  void IntegerHandler( int args )
  {
    std::cout << "MyObserver::" << __FUNCTION__ 
	      << ": args == " << args << std::endl;
  }

  MySubject *_Subject;
};

void GlobalDataHandler( void *userdata, DataEventArgs *args )
{
  std::cout << __FUNCTION__ << ": args->Data() == "
	    << args->Data() << std::endl;
}

void GlobalPointlessHandler( void *userdata, PointlessEventArgs *args )
{
  std::cout << __FUNCTION__ << std::endl;
}

void GlobalIntegerHandler( void *userdata, int args )
{
  std::cout << __FUNCTION__ << ": args == " << args << std::endl;
}

int main()
{
  MySubject s;
  MyObserver o( &s );
  int *dummy = 0;
  s.OnData.Add( &dummy, GlobalDataHandler );
  s.Pointless.Add( &dummy, GlobalPointlessHandler );
  s.IntegerEvent.Add( &dummy, GlobalIntegerHandler );

  std::cout << std::string(80, '-') << std::endl;
  s.Run();

  s.OnData.Remove( &dummy, GlobalDataHandler );
  s.OnData.Remove( &o );

  std::cout << std::string(80, '-') << std::endl;
  s.Run();

  std::cout << std::string(80, '-') << std::endl;
}
