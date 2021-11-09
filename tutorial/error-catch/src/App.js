import User from './User';
import ErrorBoundary from './ErrorBoundary';

function App() {
  const user ={ 
    id : 1,
    username : 'nana'
  };
  return (
    <ErrorBoundary>
    <User />
    {/* user props(user={user})를 넣어주지 않았기 때문에 error */}
    <b>dsfadfsafd</b>
    </ErrorBoundary>
  );
}

export default App;
