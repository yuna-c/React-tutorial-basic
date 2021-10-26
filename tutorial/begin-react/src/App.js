import React, { useRef, useState } from 'react';
// import Hello from './Hello';
// import Hi from './Hi';
// import './App.css';
// import Props from './Props'
// import Wrapper from './Wrapper';
// import IfIf from './IfIf';

// import Counter from './Counter';
// import InputSample from './InputSample';
// import InputSample2 from './InputSample2';

// import UserList from './UserList';
// import UserList2 from './UserList2';
// import UserList3 from './UserList3';

import UserList4 from './UserList4';
import CreateUser from './CreateUser';

function App() {
  //createUser에서 필요한 props 준비
  const [inputs, setInputs] = useState({
    username : '',
    email : '',
  });

  const { username, email } = inputs;
  const onChange = (e) => {
    const { name, value } = e.target;
    setInputs({
      ...inputs,
      [name] : value
    });
  };

  // 배열을 컴포넌트의 상태로 관리해주는법 
  const [users, setUsers] = useState([
    {
        id : 1,
        username : 'velopert',
        email : 'public.vepopert@gmail.com'
    },
    {
        id : 2,
        username : 'tester',
        email : 'tester@example.com'
    },
    {
        id : 3,
        username : 'liz',
        email : 'liz@example.com'
    }
  ]);




  const nextId = useRef(4);
  
  // 값이 바뀔 때 리랜더링 할 필요가 없기 때문에 useRef로 관리
  const onCreate = () => {
    //push splice sort 사용 X
    // 배열의 불변성 지키면서 새로운 항목 추가하는 법
    // 1.배열에서 spread 연산자 쓰기
    // 새로운 user 객체 만들기
    const user = {
      id : nextId.current,
      username,
      email,
    }; 
    setUsers(
      [...users, user] //spread
    ); 
    setUsers(
      // [...users, user] spread
      users.concat(user) //concat 함수
    ); //기존 배열 복사해서 넣으면서 새항목 추가
    // 2. concat함수 쓰기
    setInputs({
      username : '',
      email : ''
    });
    console.log(nextId.current); // 4
    nextId.current += 1;
  };


  // remove
  const onRemove = id => { //파라미터로 받아온 아이디랑 비교
    setUsers(users.filter(user => user.id !== id));
  };



  // const name = 'react';
  // const style= {
  //   backgroundColor: 'black',
  //   color : 'orange',
  //   fontSize : '24',
  //   padding : '1rem'
  // };

  return (
    <> {/* 플래그먼트 */}
      {/* <Hi />
      <Hello name="프롭스" color="red" />
      <Hello color="pink" />
      <Hello isSpecial/>
      <div style={style}>{name}</div> 
      <div className="gray-box"></div>

      <Props name="Props" color="red"/>
      <Wrapper>
        <Hello name="프롭스" color="red" />
        <Hello color="pink" />
      </Wrapper>

      <IfIf isSpecial2={true} name="프롭스" color="red"/>
      <IfIf isSpecial2 name="프롭스" color="red"/>

      <Counter />

      <InputSample />
      <InputSample2 />

      <UserList />
      <UserList2 />
      <UserList3 /><br/><br/> */}

      <CreateUser 
        username={username} 
        email={email} 
        onChange={onChange} 
        onCreate={onCreate}
      />
      <UserList4 
        users={users} 
        onRemove={onRemove} 
      />
    </>
   
  );
}

export default App;
