import React, { createContext, useContext, useState } from 'react';

const MyContext = createContext('defaultValue');

function Child() {
    const text = useContext(MyContext);
    // useContext : context에 있는 값을 읽어와서 사용할 수 있게해주는 리액트에 내장된 Hook
    return <div>안녕하세요? {text}</div>
}

function Parent() {
    return <Child />
}

function GrandParent () {
    return <Parent />
}

function ContextSample() {
    const [value, setValue] = useState(true);
    return (
        <MyContext.Provider value={value ? 'Good!!' : 'Bad'}>
            <GrandParent />
            <button onClick={()=> setValue(!value)}>Click ME</button>
        </MyContext.Provider>
    )
}

export default ContextSample ;