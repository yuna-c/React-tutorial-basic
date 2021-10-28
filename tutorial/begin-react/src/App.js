import React, { useRef, useMemo, useCallback, useReducer } from 'react';
import UserList5 from './UserList5';
import CreateUser from './CreateUser';

// useReducer 구현하기 
const initialState = {
    inputs: {
        username : '',
        email : '',
    },
    users : [
        {
            id : 1,
            username : 'velopert',
            email : 'public.vepopert@gmail.com',
            active : true,
        },
        {
            id : 2,
            username : 'tester',
            email : 'tester@example.com',
            active : false,
        },
        {
            id : 3,
            username : 'liz',
            email : 'liz@example.com',
            active : false,
        }
    ]
};

// reducer 함수의 틀 만들기
function reducer(state, action) {
    switch(action.type) {
        case 'CHANGE_INPUT' :
            return {
                ...state,
                inputs : {
                    ...state.inputs,
                    [action.name] : action.value
            }   
        };
        case 'CREATE_USER' :
            return {
                inputs : initialState.inputs,
                users : state.users.concat(action.user)
            }
        default : 
            // return state;
            throw new Error('Unhandled action');
    }
}

function App() {
    //현재상태, action발생시키는 함수
    const [state, dispatch] = useReducer(reducer, initialState);
    const nextId = useRef(4);
    const { users } = state;
    const { username, email } = state.inputs;

    const onChange = useCallback(e => {
        const { name, value } = e.target; // e.target에서 추출
        dispatch({
            type : 'CHANGE_INPUT',
            name,
            value,
        })
    }, []);

    const onCreate = useCallback(() => {
        dispatch({
            type : 'CREATE_USER',
            user : {
                id : nextId.current,
                username,
                email,
            }
        });
        nextId.current += 1;
    }, [username, email]);

    return (
        <>
            <CreateUser 
                username={username} 
                email={email} 
                onChange={onChange}
                onCreate={onCreate}
            />
            <UserList5 users={users} />
            <div>활성 사용자 수: 0</div> 
        </>
    
    );
}

export default App;
