        const { Engine, Render, Runner, Bodies, Composite, Events, Body } = Matter;

        // 1. Matter.js 엔진 및 월드 생성
        const engine = Engine.create();
        const world = engine.world;

        // 중력 설정
        engine.world.gravity.y = 1; // 아래로 떨어지도록 설정
        engine.world.gravity.x = 0; // 좌우로 중력 없음

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

        // 3. 색상 팔레트 (녹색 컬러 팔레트 적용)
        const colors = [
            '#A8E6CF', '#DCEDC1', '#AED581', '#81C784',
            '#4CAF50', '#388E3C', '#2E7D32', '#1B5E20'
        ];

        // 4. 캡슐 생성 함수
        function createCapsule(x, y, text, color, isAdmin = false) {
            const capsuleWidth = isAdmin ? 100 : 150; // admin 캡슐만 작게 설정
            const capsuleHeight = isAdmin ? 40 : 70;

            const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
            const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
            const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });

            const capsule = Body.create({
                parts: [leftCircle, rectangle, rightCircle],
                restitution: 0.7, // 탄성 설정
                friction: 0.1,    // 마찰 설정
                frictionAir: 0.02, // 공기 저항 추가
                label: text
            });

            return capsule;
        }

        // 5. 바닥 생성
        const ground = Bodies.rectangle(350, 410, 700, 20, {
            isStatic: true,
            render: { fillStyle: '#666666' }
        });
        Composite.add(world, ground);

        // 6. 캡슐 데이터
        const capsuleData = [
            { x: 200, y: 0, text: '#  영  주', color: colors[0] },
                    { x: 300, y: 0, text: '#  단  양', color: colors[1] },
                    { x: 400, y: 0, text: '#  영  월', color: colors[2] },
                    { x: 500, y: 0, text: '#  김  제', color: colors[3] },
                    { x: 600, y: 0, text: '#  정  읍', color: colors[4] },
                    { x: 250, y: 0, text: '#  부  안', color: colors[5] },
                    { x: 350, y: 0, text: '#  나  주', color: colors[6] },
                    { x: 450, y: 0, text: '#  화  순', color: colors[7] },
                    { x: 375, y: 0, text: 'admin', color: '#A8E6CF', isAdmin: true }, // admin 캡슐
                    { x: 150, y: 0, text: '#  서  울', color: colors[0] },
                    { x: 275, y: 0, text: '#  부  산', color: colors[1] },
                    { x: 325, y: 0, text: '#  경 기 도', color: colors[2] },
                    { x: 425, y: 0, text: '#  강 원 도', color: colors[3] },
                    { x: 525, y: 0, text: '#  대  구', color: colors[4] },
                    { x: 175, y: 0, text: '#  제  주', color: colors[5] },
                    { x: 275, y: 0, text: '#  대  전', color: colors[6] },
                    { x: 475, y: 0, text: '#  울  산', color: colors[7] },
                    { x: 575, y: 0, text: '#  광  주', color: colors[0] }
        ];

        const capsules = [];
        let currentIndex = 0;

        // 7. HTML 링크 요소 가져오기
        const adminLink = document.getElementById('admin-link');

        // 8. 캡슐 생성 (모든 캡슐 생성)
        const maxCapsules = capsuleData.length;

        const intervalId = setInterval(() => {
            if (capsules.length >= maxCapsules) {
                clearInterval(intervalId);
                console.log("캡슐 생성 중지: 최대 개수 도달");
                return;
            }

            const data = capsuleData[currentIndex];
            const capsule = createCapsule(data.x, data.y, data.text, data.color, data.isAdmin);
            Composite.add(world, capsule);
            capsules.push(capsule);

            currentIndex = (currentIndex + 1) % capsuleData.length; // 순환 생성
        }, 700);

        // 9. Matter.js 실행
        const runner = Runner.create();
        Render.run(render);
        Runner.run(runner, engine);

        // 10. 캡슐 위아래로 움직이기
        setInterval(() => {
            capsules.forEach(capsule => {
                const direction = Math.random() > 0.5 ? -1 : 1; // 위(음수) 또는 아래(양수)로 랜덤 방향 설정
                const force = 0.002; // 힘의 크기 (값을 조절 가능)

                // 위아래로 힘을 가함
                Body.applyForce(capsule, { x: capsule.position.x, y: capsule.position.y }, { x: 0, y: direction * force });
            });
        }, 500); // 500ms마다 반복 실행

        // 11. 텍스트 및 admin 링크 표시
        Events.on(render, 'afterRender', function () {
            const context = render.context;
            context.font = "bold 25px Arial";
            context.fillStyle = "#ffffff";
            context.textAlign = "center";

            capsules.forEach(capsule => {
                const angle = capsule.angle; // 캡슐의 현재 각도 가져오기

                context.save(); // 기존 상태 저장
                context.translate(capsule.position.x, capsule.position.y); // 캡슐 위치로 이동
                context.rotate(angle); // 캡슐 각도만큼 회전

                // 텍스트 표시 (admin 포함)
                if (capsule.label === 'admin') {
                    // adminLink의 스타일만 업데이트, 텍스트는 캡슐에만 표시
                    adminLink.style.display = 'block';
                    adminLink.style.left = `${capsule.position.x - 20}px`;
                    adminLink.style.top = `${capsule.position.y - 10}px`;
                } else {
                    context.fillText(capsule.label, 0, 10); // 회전 후 위치에 텍스트 표시
                }

                context.restore(); // 이전 상태 복원
            });
        });