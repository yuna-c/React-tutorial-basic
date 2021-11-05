import React, { useRef,  useReducer, useMemo, useCallback, createContext } from 'react';
import UserList5 from './UserList5';
import CreateUser from './CreateUser';
import useInputs from './useInputs';


//사용자 카운트
function countActiveUsers(users) {
    console.log('활성 사용자 수를 세는중...');
    return users.filter(user => user.active).length;
  }
  

// useReducer 구현하기 
const initialState = {
    // inputs: { // inputs 객체 
    //     username : '',
    //     email : '',
    // },
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
    switch (action.type) {
        // case 'CHANGE_INPUT' :
        //     return {
        //         ...state,
        //         inputs : {
        //             ...state.inputs,
        //             [action.name] : action.value
        //     }   
        // };
        case 'CREATE_USER' :
            return {
                inputs : initialState.inputs,
                users : state.users.concat(action.user)
            }
        case 'TOGGLE_USER' :
            return {
                ...state,
                users : state.users.map( user => 
                    user.id === action.id 
                    ? {...user, active: !user.active}
                    : user
                )
            };
        case 'REMOVE_USER' : 
            return {
                ...state,
                users : state.users.filter(user => user.id !== action.id)
            }
        default : 
            // return state;
            throw new Error('Unhandled action');
    }
}

export const UserDispatch = createContext(null);

function App() {
    //현재상태, action발생시키는 함수
    const [state, dispatch] = useReducer(reducer, initialState);
    const [form, onChange, reset] = useInputs({ // 초기값 지정 해줌
        username : '',
        email : '',
    });
    const { username, email } = form; //form 에서 username, email 을 추출해줌
    const nextId = useRef(4);
    const { users } = state;
    // const { username, email } = state.inputs;

    // const onChange = useCallback(e => {
    //     const { name, value } = e.target; // e.target에서 추출
    //     dispatch({
    //         type : 'CHANGE_INPUT',
    //         name,
    //         value,
    //     })
    // }, []);

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
        reset(); // reset호출
    }, [username, email ,reset]); // reset추가 : 커스텀 훅에서 반환한 것이기 때문에 넣어줌

    // const onToggle = useCallback(id => {
    //     dispatch({
    //         type : 'TOGGLE_USER',
    //         id
    //     });
    // }, []);

    // const onRemove = useCallback(id => {
    //     dispatch({
    //         type : 'REMOVE_USER',
    //         id
    //     }, []);
    // });
    
    const count = useMemo(() => countActiveUsers(users), [users]);
    return (
        <UserDispatch.Provider value={dispatch}>
            <CreateUser 
                username={username} 
                email={email} 
                onChange={onChange}
                onCreate={onCreate}
            />
            <UserList5 
                users={users} 
                // onToggle={onToggle} 
                // onRemove={onRemove}
            />
            <div>활성 사용자 수: {count}</div> 
        </UserDispatch.Provider>
    
    ); 
}

export default App;
