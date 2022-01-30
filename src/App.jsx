import React, { lazy, Suspense } from 'react';
import './App.css'

const Counter = lazy(() => import('@components/counter'));
const renderLoader = () => <p>Loading</p>;

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Suspense fallback={renderLoader()}>
          <Counter/>
        </Suspense>
      </header>
    </div>
  )
}

export default App
