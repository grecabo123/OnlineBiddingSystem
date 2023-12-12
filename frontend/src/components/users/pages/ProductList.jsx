import axios from 'axios'
import moment from 'moment'
import { Button } from 'primereact/button'
import { Panel } from 'primereact/panel'
import { Skeleton } from 'primereact/skeleton'
import { Tag } from 'primereact/tag'
import { Toast } from 'primereact/toast'
import React, { useEffect, useRef, useState } from 'react'
import { Link, useHistory } from 'react-router-dom/cjs/react-router-dom.min'
import swal from 'sweetalert'
import differenceBy from "lodash.differenceby";
import { NumericFormat } from 'react-number-format';
import { FcFolder } from 'react-icons/fc'
import { Card } from 'primereact/card'
import { DataTable } from 'primereact/datatable'
import { Column } from 'primereact/column'

function ProductList() {

    const history = useHistory();
    const [loading, setloading] = useState(true);
    const [Product, setProduct] = useState([]);
    const [filter, setfilter] = useState([]);
    const [selectedRows, setSelectedRows] = React.useState([]);
    const [toggleCleared, setToggleCleared] = React.useState(false);
    const toast = useRef();

    useEffect(() => {
        axios.get(`/api/ProductDetails`).then(res => {
            if (res.data.status === 200) {
                setProduct(res.data.product);
            }
            else {

            }
            setloading(false);
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
                history.push(`/user/dashboard`);
            }
        })
    }, []);


    return (
        <>
            <Toast ref={toast} />
            <div className="container-fluid p-3">
                <div className="row">
                    <Card title="My Product">
                        <div className="d-flex justify-content-end mb-3">
                            {/* <Link to="/user/add"><Button icon="pi pi-plus" className='p-button-sm p-button-info' label='Register Product' /></Link> */}
                        </div>
                        <DataTable value={Product} paginator rows={10} loading={loading} paginatorLeft>
                            <Column field='product_name' header="Product Name"></Column>
                            <Column field='product_price' header="Product Price"></Column>
                            <Column field='quantity_product' header="Product Price"></Column>
                            <Column field='product_price' header="Action"></Column>
                        </DataTable>
                    </Card>
                </div>
            </div>
        </>
    )
}

export default ProductList