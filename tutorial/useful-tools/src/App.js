/* eslint-disable */
import React, { useEffect, useState } from 'react';
import './App.css';

function App() {
    const [value, setValue] = useState(0);
    useEffect(() => {
        console.log(value);
    }, [value]);
    return (
        <div>
            <div>fdsjfkafkdlfalfs;fa</div>
            <ul>
                <li>dfasfafasdfsfdasfdfdfasdf</li>
            </ul>
        </div>
    );
}

export default App;
