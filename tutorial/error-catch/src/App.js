import React from 'react';
import User from './User';
import ErrorBoundary from './ErrorBoundary';

function App() {
    const user = {
        id : 1,
        username : 'yuna',
    }
    return (
        <ErrorBoundary>
            <User /> 
            {/* user={user} */}
            <b>dfafsdfdsfdsf</b>
        </ErrorBoundary>
    );
}

export default App;
