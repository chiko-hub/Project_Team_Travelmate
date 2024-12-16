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
  function createCapsule(x, y, text) {
      const capsuleWidth = 200; // 캡슐 너비
      const capsuleHeight = 70; // 캡슐 높이
      const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: '#FFFFFF' } });
      const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: '#FFFFFF' } });
      const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: '#FFFFFF' } });
      const capsule = Body.create({
          parts: [leftCircle, rectangle, rightCircle],
          restitution: 0.7,
          friction: 0.1,
          inertia: Infinity,
          label: text // 텍스트를 라벨로 추가
      });
      return capsule;
  }
  // 4. 바닥 생성
  const ground = Bodies.rectangle(350, 410, 700, 20, {
      isStatic: true,
      render: { fillStyle: '#666666' }
  });
  Composite.add(world, ground);
  // 5. 캡슐 데이터를 준비
    const capsuleData = [
        { x: 200, y: 50, text: '# 제 주' },
        { x: 350, y: 50, text: '# 일 본' },
        { x: 500, y: 50, text: '# 경 주' },
        { x: 275, y: 50, text: '# 서 울' },
        { x: 425, y: 50, text: '# 인 천' }
    ];
    // 6. 캡슐을 하나씩 떨어지게 추가
  let index = 0;
  function dropCapsule() {
      if (index < capsuleData.length) {
          const data = capsuleData[index];
          const capsule = createCapsule(data.x, data.y, data.text);
          Composite.add(world, capsule);
          capsules.push(capsule); // 캡슐 배열에 추가
          index++;
          setTimeout(dropCapsule, 1000); // 1초 후 다음 캡슐 생성
      }
  }
  // 캡슐 배열 초기화
  const capsules = [];
  // 캡슐 순차적으로 추가 시작
  dropCapsule();
  // 7. Matter.js 실행
  const runner = Runner.create();
  Render.run(render);
  Runner.run(runner, engine);
  // 8. 텍스트 렌더링
  Events.on(render, 'afterRender', function() {
      const context = render.context;
      context.font = "bold 16px Arial"; // 글자 굵게
      context.fillStyle = "#000000";
      context.textAlign = "center";
      // 캡슐의 중심에 텍스트 그리기
      capsules.forEach(capsule => {
          context.fillText(capsule.label, capsule.position.x, capsule.position.y + 5);
      });
  });