import React from 'react';
import UserList from './UserList';
import Hello from './Hello';
import Hi from './Hi';
import './App.css';
import Props from './Props'
import Wrapper from './Wrapper';
import IfIf from './IfIf';

import Counter from './Counter';
import InputSample from './InputSample';
import InputSample2 from './InputSample2';

function App() {
  const name = 'react';
  const style= {
    backgroundColor: 'black',
    color : 'orange',
    fontSize : '24',
    padding : '1rem'
  };
  return (
    <> {/* 플래그먼트 */}
      <UserList />
      <Hi />
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
    </>
   
  );
}

export default App;
