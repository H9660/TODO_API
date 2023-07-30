#include <iostream>
#include <vector>
#include <limits.h>
using namespace std;
int main()
{
    int t;
    cin >> t;
    while (t--)
    {
        int n;
        cin >> n;
        vector<int> arr(n);
        for (int i = 0; i < n; i++)
            cin >> arr[i];

        vector<vector<int> > ans;
        int cnt = 0;
        for (int i = 0; i < n; i++)
        {
            for (int j = i; j < n; j++)
            {
                if (arr[j] < arr[i])
                {
                    if (arr[j] + arr[i] > arr[j])
                    {
                        while (arr[i] > arr[j])
                        {
                            cnt++;
                            arr[i] += arr[j];
                            vector<int> curr;
                            curr.push_back(j);
                            curr.push_back(i);
                            ans.push_back(curr);
                        }
                    }
                }
            }
        }
        
        cout<<cnt<<endl;
        for (auto i : ans)
        {
            for (auto j : i)
                cout << j << " ";
            cout << endl;
        }
    }
    return 0;
}
