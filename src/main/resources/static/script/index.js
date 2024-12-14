const { Engine, Render, Runner, Bodies, Composite } = Matter;

// Matter.js 엔진 생성
const engine = Engine.create();
const render = Render.create({
    element: document.getElementById('image-container'), // 캔버스를 렌더링할 요소
    engine: engine,
    options: {
        width: 700,
        height: 390,
        wireframes: false, // 와이어프레임 비활성화
        background: '#f0f0f0' // 배경색
    }
});

// 바닥 생성
const ground = Bodies.rectangle(350, 380, 700, 20, { isStatic: true, render: { fillStyle: '#2ecc71' } });
Composite.add(engine.world, ground);

// 움직이는 박스 생성
const boxA = Bodies.rectangle(150, 100, 80, 80, { render: { fillStyle: '#3498db' } });
const boxB = Bodies.rectangle(300, 100, 80, 80, { render: { fillStyle: '#3498db' } });
const boxC = Bodies.rectangle(400, 50, 80, 80, { render: { fillStyle: '#e74c3c' } });
const boxD = Bodies.rectangle(600, 50, 80, 80, { render: { fillStyle: '#3498db' } });

// 월드에 박스 추가
Composite.add(engine.world, [boxA, boxB, boxC, boxD]);

// 엔진 및 렌더링 시작
Engine.run(engine);
Render.run(render);

// 애니메이션 루프 실행
const runner = Runner.create();
Runner.run(runner, engine);