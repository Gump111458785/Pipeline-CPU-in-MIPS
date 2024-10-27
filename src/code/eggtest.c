#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main()
{
	while(1)
	{ 
	int init_floor;
	int init_resistance;
    int location=1;
    int result_material_cost=0;
    int result_human_cost=0;
	printf("������¥������");
	scanf("%d", &init_floor);

	printf("��������ˤֵ��");
	scanf("%d", &init_resistance);

	int result_attempt_cnt = 0;
	int result_broken_cnt  = 0;
	int result_is_last_broken = 0;

	int l = 0, r = init_floor;

	while (l < r){

		result_attempt_cnt++;

		int mid = (l + r + 1) / 2;
        if(mid>location) {
            result_material_cost += (mid - location)*2;
            result_human_cost += (mid - location)*4;
        }
        else{
            result_material_cost += location - mid;
            result_human_cost += location - mid;
        }
		if (mid > init_resistance){
            result_material_cost += 4;
            result_human_cost += 2;
			result_is_last_broken = 1;
			r = mid - 1;
			result_broken_cnt ++;
		}
		else{
			result_is_last_broken = 0;
			l = mid;
		}
        location = mid;
		printf("���е�%d��ʵ��, ��%d���Ӽ���, ���μ���", result_attempt_cnt, mid);
		printf(result_is_last_broken ? "ˤ��\n" : "û��\n");
	}

	printf("������%d�Σ�ˤ�鼦��%d�������һ�μ���", result_attempt_cnt, result_broken_cnt );
	printf((result_is_last_broken ? "ˤ��\n" : "û��\n"));
    printf("�������ѷ�ʱ���ܳɱ�Ϊ %d\n�������ɱ�����ʱ���ܳɱ�Ϊ %d\n",result_material_cost,result_human_cost);
}
	return 0;
}
