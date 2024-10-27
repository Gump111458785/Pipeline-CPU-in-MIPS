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
	printf("请输入楼层数：");
	scanf("%d", &init_floor);

	printf("请输入耐摔值：");
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
		printf("进行第%d次实验, 在%d层扔鸡蛋, 本次鸡蛋", result_attempt_cnt, mid);
		printf(result_is_last_broken ? "摔碎\n" : "没碎\n");
	}

	printf("共尝试%d次，摔碎鸡蛋%d个，最后一次鸡蛋", result_attempt_cnt, result_broken_cnt );
	printf((result_is_last_broken ? "摔碎\n" : "没碎\n"));
    printf("在物质匮乏时期总成本为 %d\n在人力成本增长时期总成本为 %d\n",result_material_cost,result_human_cost);
}
	return 0;
}
