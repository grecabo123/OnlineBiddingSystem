import axios from 'axios'
import { Button } from 'primereact/button';
import { Card } from 'primereact/card';
import { Column } from 'primereact/column';
import { DataTable } from 'primereact/datatable'
import { Panel } from 'primereact/panel';
import { Toast } from 'primereact/toast';
import React, { useEffect, useRef, useState } from 'react'
import { Chart } from 'primereact/chart';


function ProductTables() {

    var months =[];
    var income = [];

    const [Product, setProduct] = useState([]);
    const toast = useRef();
    const [Income, setIncome] = useState([]);

    useEffect(() => {
        UpdateProduct();
    }, [])

    const UpdateProduct = () => {
        axios.get(`/api/GetProductUpdate/${localStorage.getItem('auth_id')}`).then(res => {
            if (res.data.status === 200) {
                setProduct(res.data.data)
                setIncome(res.data.income);
            }
        }).catch((error) => {
            if (error.response.status === 500) {

            }
        })
    }


    for (let index = 0; index < Income.length; index++) {
        const name = Income[index].month;
        const total = Income[index].income;
        months.push(name)
        income.push(total);
    }


    const data = {

        labels: months,
        datasets: [
            {
                label: 'Monthly Income',
                data: income,
                // backgroundColor: product_color,
                borderWidth: 1
            }
        ]
    };
    const options = {
        indexAxis: 'y',
        maintainAspectRatio: false,
        aspectRatio: 0.8,
        scales: {
            x: {
                grid: {
                    display: false
                }
            },
            y: {
                beginAtZero: true,
                grid: {
                    display: false
                }
            }
        }
    };

    const GetData = () => {
        UpdateProduct();
        toast.current.show({ severity: "success", summary: "Fetch Data", detail: "Successfully" })
    }

    const header = <div className='d-flex justify-content-between align-items-center'>
        <span>Product Price</span>
        <Button className='p-button-sm p-button-info' onClick={GetData} label='Refresh' />
    </div>

    const PriceFormat = (Product) => {
        return (
            <>
                <span>₱{Product.product_price.toFixed(2)}</span>
            </>
        )
    }
    return (
        <div>
            <Toast ref={toast} />
            <DataTable header={header} value={Product} paginator paginatorLeft rows={5}>
                <Column field='product_name' header="Product Name"></Column>
                <Column field='product_price' body={PriceFormat} header="Product Price "></Column>
            </DataTable>
            <div className="mt-4">
                <Card title="">
                    <Chart type="bar" style={{ height: "320px" }} width='100%' data={data} options={options} />

                </Card>
            </div>
        </div>
    )
}

export default ProductTables