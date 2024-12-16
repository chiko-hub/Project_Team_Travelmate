 const { Engine, Render, Runner, Bodies, Composite, Body, Events } = Matter;

 // 1. Matter.js 엔진 및 월드 생성
 const engine = Engine.create();
 const world = engine.world;

 // 2. 렌더링 설정
 const render = Render.create({
     element: document.getElementById('image-container'),
     engine: engine,
     options: {
         width: 700,
         height: 430,
         wireframes: false,
         background: '#2D2D36'
     }
 });

 // 3. 캡슐 생성 함수
 function createCapsule(x, y, text, color) {
     const capsuleWidth = 200;
     const capsuleHeight = 70;

     const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
     const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
     const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });

     const capsule = Body.create({
         parts: [leftCircle, rectangle, rightCircle],
         restitution: 0.7,
         friction: 0.1,
         inertia: Infinity,
         label: text
     });

     return capsule;
 }

 // 4. 바닥 생성
 const ground = Bodies.rectangle(350, 410, 700, 20, {
     isStatic: true,
     render: { fillStyle: '#666666' }
 });
 Composite.add(world, ground);

 // 5. 캡슐 데이터
 const capsuleData = [
     { x: 200, y: 0, text: '#  제  주', color: '#FF6347' },
     { x: 350, y: 0, text: '#  일  본', color: '#4682B4' },
     { x: 500, y: 0, text: '#  경  주', color: '#32CD32' },
     { x: 275, y: 0, text: '#  서  울', color: '#FFD700' },
     { x: 425, y: 0, text: '#  인  천', color: '#DA70D6' }
 ];

 const capsules = [];
 let currentIndex = 0;

 // 6. 순차적으로 캡슐 생성 (최대 15개 제한)
 const maxCapsules = 13;

 const intervalId = setInterval(() => {
     if (capsules.length >= maxCapsules) {
         clearInterval(intervalId); // 15개를 넘으면 반복 생성 중지
         console.log("캡슐 생성 중지: 최대 개수 도달");
         return;
     }

     const data = capsuleData[currentIndex];
     const capsule = createCapsule(data.x, data.y, data.text, data.color);
     Composite.add(world, capsule);
     capsules.push(capsule);

     currentIndex = (currentIndex + 1) % capsuleData.length; // 순환 생성
 }, 2000);

 // 7. Matter.js 실행
 const runner = Runner.create();
 Render.run(render);
 Runner.run(runner, engine);

 // 8. 텍스트 렌더링
 Events.on(render, 'afterRender', function() {
     const context = render.context;
     context.font = "bold 28px Arial"; // 글자 크게
     context.fillStyle = "#ffffff";
     context.textAlign = "center";

     capsules.forEach(capsule => {
         context.fillText(capsule.label, capsule.position.x, capsule.position.y + 10);
     });
 });
